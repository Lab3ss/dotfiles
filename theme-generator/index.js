const Color = require('color')
const axios = require('axios')
const formData = require('form-data');
const trianglify = require('trianglify')
const fs = require('fs')
const path = require('path')

/*
const mock = [
  '222831393e4600adb5eeeeee',
  'f9ed69f08a5db83b5e6a2c70',
  'f38181fce38aeaffd095e1d3',
  '08d9d6252a34ff2e63eaeaea',
  'e3fdfdcbf1f5a6e3e971c9ce',
  'a8d8eaaa96dafcbad3ffffd2',
  'ffc7c7ffe2e2f6f6f68785a2',
  '364f6b3fc1c9f5f5f5fc5185',
  'f9f7f7dbe2ef3f72af112d4e',
  'ffb6b9fae3d9bbded661c0bf',
  'e4f9f530e3ca11999e40514e',
  'defcf9cadefcc3bef0cca8e9',
  '2b2e4ae8454590374953354a',
  'f67280c06c846c5b7b355c7d',
  '00b8a9f8f3d4f6416cffde7d',
  'e23e5788304e522546311d3f',
  'ffcfdffefdcae0f9b5a5dee5',
  'a8e6cfdcedc1ffd3b6ffaaa5',
  '2121213232320d737714ffec',
  'bad7dfffe2e2f6f6f699ddcc',
  '48466d3d84a846cdcfabedd8',
  'ffc8c8ff9999444f5a3e4149',
  '2d4059ea5455f07b3fffd460',
  '1b262c0f4c753282b8bbe1fa',
  '3ec1d3f6f7d7ff9a00ff165d',
  'f4eeffdcd6f7a6b1e1424874',
  'a1eafbfdfdfdffcef3cabbe9',
  'f0f5f9c9d6df52616b1e2022',
  '6fe7dd3490de6639a6521262',
  'f7fbfcd6e6f2b9d7ea769fcd',
  '8ef6e49896f1d59bf6edb1f1',
  'd4a5a5ffecdaf9ffeaa6d0e4',
  '30384100adb5eeeeeeff5722',
  '1fab8962d2a29df3c4d7fbe8',
  'a8e6cffdffabffd3b6ffaaa5',
  'f5eee6f3d7cae6a4b4c86b85',
  '07689fa2d5f2fafafaff7e67',
  'dcedc2ffd3b5ffaaa6ff8c94',
  'f85f73fbe8d3928a97283c63',
  '3038413a4750d72323eeeeee'
]
*/

const mock = [
            '1D2D50133B5C1E5F74FCDAB7',
            '2A09443B185FA12568FEC260',
            '161616346751ECDBBAC84B31',
            'F39189BB80826E7582046582',
            '2E4C6D396EB0DADDFCFC997C',
            '1F1D363F3351864879E9A6A6',
            '726A95709FB0A0C1B8F4EBC1',
            '383E56F69E7BEEDAD1D4B5B0',
            '557571D49A89F7D1BAF4F4F4',
            '305F72F1D1B5F0B7A4F18C8E',
            'BEDBBB8DB59692817A707070',
            '33313B62374E007880FDC57B',
            '44000D83142CAD1D45F9D276',
            '35394126282B5F85DB90B8F8',
            'F4ABC4595B83333456060930',
            '7D063331112CF2A07BFBDCC4',
            '283c63F85F73FBE8D3928A97',
    ]

const getColorAverage = (color) => {
        const c = color.rgb().array()
        return (c.reduce((a, b) => a + b, 0) / c.length)
}

const extractColors = (string) => {
    let colors = [
        Color(`#${string.substring(0, 6)}`),
        Color(`#${string.substring(6, 12)}`),
        Color(`#${string.substring(12, 18)}`),
        Color(`#${string.substring(18, 24)}`)
    ]

    // Extract primary color

    let primaryIndex = 0
    let biggerGap = 0

    for (let i = 0; i < colors.length; i++) {
        const c = colors[i].rgb().array().sort()
        const gap = c[2] - c[0]
        if (gap > biggerGap) {
            biggerGap = gap
            primaryIndex = i
        }
    }

    const primary = colors[primaryIndex]
    colors = colors.filter((c, i) => i !== primaryIndex)

    // Extract lighter color

    let lighterIndex = 0
    let lighterAvg = 0

    for (let i = 0; i < colors.length; i++) {
        const avg = getColorAverage(colors[i])
        if (avg > lighterAvg) {
            lighterAvg = avg
            lighterIndex = i
        }
    }

    const lighter = colors[lighterIndex]
    colors = colors.filter((c, i) => i !== lighterIndex)

    // Extract darker color

    let darkerIndex = 0
    let darkerAvg = 255

    for (let i = 0; i < colors.length; i++) {
        const avg = getColorAverage(colors[i])
        if (avg < darkerAvg) {
            darkerAvg = avg
            darkerIndex = i
        }
    }

    const darker = colors[darkerIndex]
    colors = colors.filter((c, i) => i !== darkerIndex)

    // Extract secondary color

    const secondary = colors[0]
    
    return { primary, secondary, lighter, darker }
}

const getColors = new Promise((res, rej) => {

    res(mock)
    /*
    // Fetch top colors schemes from colorhunt.co
    const url = 'https://colorhunt.co/php/feed.php'
    const data = new formData();

    data.append('sort', 'popular');
    data.append('step', '0');
    data.append('timeframe', '4000');

    const config = {
      method: 'post',
      url,
      headers: { 
        ...data.getHeaders()
      },
      data : data
    };

    axios(config)
    .then(function (response) {
        if (response && response.data) {
            const sorted = response.data
                .sort((a, b) => parseInt(a.likes, 10) > parseInt(b.likes, 10) ? -1 : 1)
                // .map(e => e.code)
            console.log(sorted)
        }
    })
    .catch(function (error) {
      console.log(`Error fetching colors from colorhunt.co : ${error}`);
        rej(error)
    });
    */
    
})

const schemeFilter = (scheme) => {
    return true

    const { primary, secondary, lighter, darker } = extractColors(scheme)
    
    const primaryAvg = getColorAverage(primary)
    if (primaryAvg < 40 || primaryAvg > 210) {
        console.info('eliminated because of primary', primaryAvg)
        return false
    }

    const lighterAvg = getColorAverage(lighter)
    if (lighterAvg < 130 || lighterAvg < primaryAvg) {
        console.info('eliminated because of lighter', lighterAvg)
        return false
    }

    const darkerAvg = getColorAverage(darker)
    if (darkerAvg > 120 || darkerAvg > primaryAvg) {
        console.info('eliminated because of darker', darkerAvg)
        return false
    }
    return true
}

const selectScheme = (schemes) => {
    console.log('BEFORE FILTERS ', schemes.length)
    const candidates = schemes.filter(schemeFilter)
    console.log('AFTER FILTERS ', candidates.length)
    const index = Math.floor(Math.random() * candidates.length)
    return extractColors(candidates[index])
}

const scheme = selectScheme(mock)

// 4 main colors from selected scheme
const primary = scheme.primary.hex()
const secondary = scheme.secondary.hex()
const lighter = scheme.lighter.hex()
const darker = scheme.darker.hex()

const baseBlack = Color('#000000')
const baseWhite = Color('#FFFFFF')

// One terminal bg color
let terminal = scheme.darker.mix(baseBlack, 0.2)
while(getColorAverage(terminal) > 30) {
    terminal = terminal.mix(baseBlack, 0.1)
}

// Extract 8 font colors from scheme

let blackLight = terminal.mix(baseWhite, 0.1)

let white = scheme.lighter.mix(baseWhite, 0.2)
while(getColorAverage(white) < 225) {
    white = white.mix(baseWhite, 0.2)
}

let primaryColor = Color(primary)
while(getColorAverage(primaryColor) < 128) {
    primaryColor = primaryColor.mix(baseWhite, 0.1)
}

let secondaryColor = Color(secondary)
while(getColorAverage(secondaryColor) < 128) {
    secondary = secondaryColor.mix(baseWhite, 0.1)
}

const color0 = blackLight.hex() // black light
const color7 = white.hex() // white
const color2 = primaryColor.hex()     // green
const color1 = secondaryColor.hex()   // red
const color5 = lighter   // magenta
const color6 = scheme.darker.mix(baseWhite, 0.4).hex()  // cyan
const color3 = primaryColor.mix(baseWhite, 0.2).hex()   // yellow
const color4 = secondaryColor.mix(baseWhite, 0.2).hex()   // yellow

/*
getColors().then((schemes) => {
    const scheme = selectScheme(schemes)

})

*/

const canvas = trianglify({
  width: 2560,
  height: 1440,
  cellSize: 400,
  variance: 0.5,
  xColors: [darker, primary, secondary, lighter],
  yColors: 'match',
}).toCanvas()

const bgPath = path.join(__dirname, 'trianglify.png')
const file = fs.createWriteStream(bgPath)
canvas.createPNGStream().pipe(file)

const schemePath = path.join(__dirname, 'scheme')
const schemeFileContent = `${primary} ${secondary} ${lighter} ${darker} ${terminal.hex()}\n${color0} ${color1} ${color2} ${color3} ${color4} ${color5} ${color6} ${color7}`
fs.writeFileSync(schemePath, schemeFileContent, 'UTF-8')
