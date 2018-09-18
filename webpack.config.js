const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

const config = {
    mode: 'development',
    entry: path.join(__dirname, 'src/index.js'),
    output: {
        path: path.join(__dirname, 'build'),
        filename: 'index.js',
    },
    module: {
        rules: [{
            test: /\.elm$/,
            use: [{
                loader: 'elm-webpack-loader'
            }]
        }]
    },
    plugins: [
        new HtmlWebpackPlugin()
    ]
}

module.exports = config;