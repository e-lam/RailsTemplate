var fs = require('fs');

/**
 * Create a directory only if it doesn't already exists
 * @param  {string} dir Directory Path
 * @return {}
 */
module.exports.createDirectoryIfNeeded = function(dir){
  if (!fs.existsSync(dir)){
    fs.mkdirSync(dir);
  }
}

module.exports.createEmptyFile = function(path){
  fs.writeFile(path, '', function(error){
    if (error){ return console.error(error) }
  })
}

