const trianglify = require('trianglify')
const fs = require('fs')
const path = require('path')

const canvas = trianglify({
  width: 2560,
  height: 1440,
  cellSize: 24,
  variance: 1,
  xColors: ['#222B3E', '#111726','#111726', '#111726', '#222B3E', '#222B3E', '#111726','#111726', '#111726', '#222B3E'],
  yColors: 'match',
  colorFunction: trianglify.colorFunctions.sparkle(0.5),
}).toCanvas()

const bgPath = path.join(__dirname, 'trianglify.png')
const file = fs.createWriteStream(bgPath)
canvas.createPNGStream().pipe(file)
