const path = require('path');
const IgnoreEmitPlugin = require('ignore-emit-webpack-plugin');

const config = {
    entry: path.join(__dirname, 'src/index.html'),
    output: {
        path: path.join(__dirname, 'build'),
        filename: 'index.js',
    },
    module: {
        rules: [{
            test: /index.html/,
            use: [{
                loader: 'file-loader',
                options: {
                    name: '[name].[ext]'
                }
            }]
        }]
    },
    plugins: [
        new IgnoreEmitPlugin('index.js')
    ]
}

module.exports = config;
