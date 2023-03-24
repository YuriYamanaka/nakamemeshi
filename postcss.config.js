module.exports = {
  plugins: [
    require('foodcss-import'),
    require('foodcss-flexbugs-fixes'),
    require('foodcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      stage: 3
    })
  ]
}
