const path = require('path');

module.exports = {
  entry: './source/javascripts/all.js',
  output: {
    filename: 'all.js',
    path: path.resolve(__dirname, './build/javascripts')
  }
};