import plugin from 'tailwindcss/plugin'
/** @type {import('tailwindcss').Config} */
export const content = ['./dist/**/*.{html,js}', './node_modules/tw-elements/dist/js/**/*.js']
export const theme = {
  fontFamily: {
    montserrat: ['Montserrat'],
    roboto: ['Roboto'],
  },
  extend: {
    colors: {
      colormain: '#00a19a',
      coloralt: '#006666'
    }
  },
}
export const plugins = [
  plugin(function ({ addComponents }) {
    addComponents({
      '.navBrandDesk': 
      {
        'transition': 'height 0.3s ease-in-out',
        'height': '5rem'
      },
      '.brand-shrink': 
      {
        'height': '4rem'
      },
      '#dropdownNavbar':
      {
          'transition': 'display 0.5s ease-in-out',
          'display': 'hidden'
      }
    })
  }),
  require('tw-elements/dist/plugin')
]

