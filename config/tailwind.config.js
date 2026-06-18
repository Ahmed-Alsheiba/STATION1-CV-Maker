const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      colors:{
        'light': "#FFFCF2",
        'beige': "#CCC5B9",
        'pdark': "#252422",
        'ldark': "#403D39",
        'porange': "#EB5E28",

        // Designer template (White & Beige Minimalist)
        'designer-sidebar': "#F1EAE2",
        'designer-accent': "#745237",
        'designer-beige': "#E3DBCC",
        'designer-cream': "#FAF6F1",

        // Sales template (light periwinkle)
        'sales-sidebar': "#D5DEE6",
        'sales-ink': "#464A4E",
        'sales-dark': "#241D19",
        'sales-muted': "#737373",

        // Minimal template (black-on-white real estate)
        'minimal-muted': "#A6A6A6",
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        publicsans: ['"Public Sans"', 'sans-serif'],   // designer headings/name
        garet: ['"Mulish"', 'sans-serif'],             // designer body (Garet substitute)
        opensans: ['"Open Sans"', 'sans-serif'],       // minimal / real estate
        poppins: ['"Poppins"', 'sans-serif'],          // sales body
        montserrat: ['"Montserrat"', 'sans-serif'],    // sales secondary
        display: ['"Anton"', '"Oswald-Variable"', 'sans-serif'], // sales name (TT Drugs substitute)
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
