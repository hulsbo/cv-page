<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math" version="3.0">

    <xsl:param name="xml" select="doc('./index.xml')"/>

    <xsl:strip-space elements="*"/>
    <xsl:output method="xhtml" indent="yes"/>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>


    <!-- Run this template for each skillGroup-->
    <xsl:template match="div[@id = 'xml:competencesContainer']">

        <xsl:copy>
            <xsl:apply-templates select="@*"/>

            <!-- Apply the template forwarding the $template of the html.-->
            <xsl:apply-templates select="$xml/curriculumVitae/competences/competenceGroup">
                <xsl:with-param name="template" select="./div"/>
            </xsl:apply-templates>
        </xsl:copy>

    </xsl:template>

    <!-- competenceGroup template -->
    <xsl:template match="competenceGroup">
        <xsl:param name="template" required="yes"/>
        <xsl:variable name="contextNode" select="."/>

        <xsl:copy select="$template">

            <xsl:apply-templates select="@*"/>

            <xsl:copy select="h2">
                <xsl:apply-templates select="@*"/>
                <xsl:value-of select="upper-case(string($contextNode/@name))"/>
            </xsl:copy>

            <xsl:copy select="ul">
                <xsl:apply-templates select="@*"/>
                <xsl:apply-templates select="$contextNode/competence">
                    <xsl:with-param name="template" select="./li"/>
                </xsl:apply-templates>
            </xsl:copy>

        </xsl:copy>

    </xsl:template>

    <!-- competence template -->
    <xsl:template match="competence">
        <xsl:param name="template" required="yes"/>
        <xsl:variable name="contextNode" select="."/>

        <xsl:copy select="$template">
            <xsl:apply-templates select="@*"/>
            <xsl:value-of select="$contextNode"/>
        </xsl:copy>

    </xsl:template>


    <!-- profile template -->
    <xsl:template match="div[@id = 'xml:profileContaienr']">

        <xsl:copy-of select="h2"/>

        <xsl:copy select="ul">
            <xsl:apply-templates select="@*"/>

            <!-- Apply the template forwarding the $template of the html.-->
            <xsl:apply-templates select="$xml/curriculumVitae/profile/highlight">
                <xsl:with-param name="template" select="./li"/>
            </xsl:apply-templates>
        </xsl:copy>

    </xsl:template>

    <!-- highlight template -->
    <xsl:template match="highlight">
        <xsl:param name="template" required="yes"/>
        <xsl:variable name="contextNode" select="."/>

        <xsl:copy select="$template">
            <xsl:apply-templates select="@*"/>
            <xsl:value-of select="$contextNode"/>
        </xsl:copy>

    </xsl:template>

    <!-- profile template -->
    <xsl:template match="div[@id = 'xml:experienceContainer']">

        <xsl:copy-of select="h2"/>



        <!-- Apply the template forwarding the $template of the html.-->
        <xsl:apply-templates select="$xml/curriculumVitae/professionalExperience/position">
            <xsl:with-param name="template" select="./div"/>
        </xsl:apply-templates>

    </xsl:template>

    <!-- position template -->
    <xsl:template match="position">
        <xsl:param name="template" required="yes"/>
        <xsl:variable name="contextNode" select="."/>

        <xsl:copy select="$template">
            <xsl:apply-templates select="@*"/>

            <xsl:copy select="div">
                <xsl:apply-templates select="@*"/>

                <!-- @role -->
                <xsl:copy select="h2[1]">
                    <xsl:apply-templates select="@*"/>
                    <xsl:value-of select="string($contextNode/@role)"/>
                </xsl:copy>

                <!-- period -->
                <xsl:copy select="h2[2]">
                    <xsl:apply-templates select="@*"/>
                    <xsl:variable name="period" select="$contextNode/period"/>
                    
                    <xsl:value-of select="string($period/@start)"/>
                    <xsl:text> - </xsl:text>
                    <xsl:choose>
                        <xsl:when test="string($period/@end)">
                            <xsl:value-of select="string($period/@end)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>Ongoing</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:copy>

            </xsl:copy>
            
            <xsl:message select="string(./p[2]/@class)"/>
            
            <xsl:apply-templates select="$contextNode/desc/*">
                <xsl:with-param name="paraStyle" as="xs:string" select="string(./p[1]/@class)"/>
                <xsl:with-param name="quoteStyle" as="xs:string" select="string(./p[2]/@class)"/>
            </xsl:apply-templates>
       
        </xsl:copy>

    </xsl:template>
    
    
    <!-- p and q -->
    <xsl:template match="p[ancestor::div[@id = ('experienceContainer', 'educationContainer')]]">
        <xsl:param name="paraStyle" required="yes"/>
        
        <p>
            <xsl:attribute name="class" select="$paraStyle"/>
        </p> 
        
    </xsl:template>
    
    <xsl:template match="q">
        <xsl:param name="quoteStyle" required="yes"/>
        
        <p>
            <xsl:attribute name="class" select="$quoteStyle"/>
        </p>        
        
    </xsl:template>

    <!-- Suppress ids starting with xml: -->
    <xsl:template match="@id[contains(string(.), 'xml:')]"/>

</xsl:stylesheet>
