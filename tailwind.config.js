/** @type {import('tailwindcss').Config} */
module.exports = {
	content: ["./**/*.{html,js}"],
	theme: {
		listStyleType: {
			square: 'square'
		},
		listStyleImage: {
			checkmark: "url('./graphics/check-mark.png')",
			markInCircle: "url('./graphics/check-mark-in-circle.svg')"
		},
		extend: {},
	},
	plugins: [],
}

