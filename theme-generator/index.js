const trianglify = require('trianglify')
const fs = require('fs')

const colors = process.argv.slice(2);

const canvas = trianglify({
  width: 2560,
  height: 1440,
  cellSize: 400,
  variance: 0.5,
  xColors: colors,
  yColors: 'match',
}).toCanvas()

const file = fs.createWriteStream('./.backgrounds/trianglify.png')
canvas.createPNGStream().pipe(file)
