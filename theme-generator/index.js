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

try {
    const file = fs.createWriteStream('/home/lab3ss/.backgrounds/trianglify.png')
    canvas.createPNGStream().pipe(file)
} catch (e){
    console.error(e)
}
