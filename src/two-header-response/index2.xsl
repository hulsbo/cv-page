<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math" version="3.0">

    <xsl:strip-space elements="*"/>
    <xsl:output method="xhtml" indent="yes"/>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/">


        <html xmlns="http://www.w3.org/1999/xhtml">

            <head>
                <title>Curriculum Vitae - Oskar Huledal</title>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <!-- Let's avoid touching the "Confusing Selector Soup". -->
                <link href="../output.css" rel="stylesheet"/>
            </head>

            <body>

                <div data-elt="page">

                    <div >
                        <!-- image and title -->
                        <div data-elt="image-title">
                            <div data-elt="image">
                                <img src="./graphics/meinpolo_softend.png" alt="Me in polo."/>
                            </div>
                            <!-- title -->
                            <div data-elt="title">
                                <!-- name -->
                                <p data-elt="name">Oskar Huledal</p>
                                <!-- role -->
                                <p data-elt="role">Web/XML Software Developer</p>
                            </div>
                        </div>
                        <!-- contacts -->
                        <div data-elt="contacts">
                            <!-- Location -->
                            <div data-elt="image-title">
                                <!-- Icon -->
                                <img alt="location logo"/>
                                <!-- Text -->
                                <p>
                                    <a href="https://maps.google.com/?q=57.70887,11.97&amp;ll=51,1.8&amp;z=5" target="_blank">Göteborg, Sweden</a>
                                </p>
                            </div>
                            <!-- Mail -->
                            <div>
                                <!-- Icon -->
                                <img alt="mail logo"/>
                                <!-- Text -->
                                <p>
                                    <a href="mailto:oskar.huledal@gmail.com">oskar.huledal@gmail.com</a>
                                </p>
                            </div>
                            <!-- GitHub -->
                            <div >
                                <!-- Icon -->
                                <img alt="github logo"/>
                                <!-- Text -->
                                <p>
                                    <a target="_blank">hulsbo</a>
                                </p>
                            </div>
                            <!-- LinkedIn -->
                            <div >
                                <!-- Icon -->
                                <img alt="linkedIn logo"/>
                                <!-- Text -->
                                <p>
                                    <a target="_blank">LinkedIn</a>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div data-elt="columns">

                        <div data-elt="column-1">

                            <xsl:apply-templates select=".//competences" mode="div"/>

                            <xsl:apply-templates select=".//languages" mode="div"/>

                        </div>

                        <div data-elt="column-2">

                            <xsl:apply-templates select=".//profile" mode="div"/>

                            <xsl:apply-templates select=".//professionalExperience" mode="div"/>

                            <xsl:apply-templates select=".//education" mode="div"/>

                            <xsl:apply-templates select=".//projects" mode="div"/>

                            <xsl:apply-templates select=".//endorsements" mode="div"/>

                        </div>

                    </div>

                </div>

            </body>

        </html>

    </xsl:template>

    <xsl:template match="location">

        <div data-elt="location">

            <div data-elt="name">
                <xsl:value-of select="./name/text()"/>
            </div>

            <div data-elt="long">
                <xsl:value-of select="./name/text()"/>
            </div>



        </div>

    </xsl:template>

    <xsl:template match="period"> </xsl:template>

    <xsl:template match="desc"> </xsl:template>

    <xsl:template match="*" mode="div">
        <div data-elt="{local-name()}">
            <xsl:apply-templates select="@*"/>
            <xsl:value-of select="./text()"/>
            <xsl:apply-templates select="*" mode="div"/>
        </div>
    </xsl:template>

</xsl:stylesheet>
