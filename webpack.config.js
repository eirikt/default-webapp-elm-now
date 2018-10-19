const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

const config = {
    mode: 'development',
    entry: [
        path.join(__dirname, 'src/index.js'),
        path.join(__dirname, 'src/scss/style.scss')
    ],
    output: {
        path: path.join(__dirname, 'build'),
        filename: 'index.js',
    },
    module: {
        rules: [{
            test: /\.elm$/,
            use: [{
                loader: 'elm-hot-webpack-loader'
            }, {
                loader: 'elm-webpack-loader'
            }]
        }, {
            test: /\.scss$/,
            use: [{
                loader: 'style-loader'
            }, {
                loader: 'css-loader'
            }, {
                loader: 'sass-loader'
            }]
        }]
    },
    plugins: [
        new HtmlWebpackPlugin({
            template: path.join(__dirname, 'src/index.template.html')
        })
    ],
    devServer: {
        port: 9000,
        overlay: {
            warnings: true, // NB! Very strict indeed - ok at project start
            errors: true
        }
    },
};

module.exports = config;
