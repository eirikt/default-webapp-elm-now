const path = require('path');
const CopyWebpackPlugin = require('copy-webpack-plugin')
const HtmlWebpackPlugin = require('html-webpack-plugin');

const config = {
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
    devServer: {
        port: 9000,
        overlay: {
            warnings: true, // NB! Very strict indeed - ok at project start
            errors: true
        }
    },
};

let copyWebpackPluginConfig = [
    {
        from: 'src/assets/favicons/**/*',
        flatten: true
    }
];
let copyWebpackPluginOptions = {}

let htmlWebpackPluginConfig = {
    template: path.join(__dirname, 'src/index.template.html')
};

module.exports = (env, argv) => {
    console.log('Webpack build mode: ' + argv.mode);

    if (argv.mode === 'production') {
        console.log('Removing \'devServer\'...');
        delete config.devServer;

        console.log('Removing \'elm-hot-webpack-loader\'...');
        delete config.module.rules[0].use.shift();

        console.log('Executing \'elm make\' with \'--optimize\' flag...');
        config.module.rules[0].use[0].options = {
            optimize: true
        };

        console.log('Minifying HTML...');
        htmlWebpackPluginConfig.minify = {
            collapseWhitespace: true,
            removeComments: true
        }

    } else { // => 'development'
        console.log('Adding Elm\'s debug overlay to output...');
        config.module.rules[0].use[1].options = {
            debug: true
        };
    }

    config.plugins = [
        new CopyWebpackPlugin(copyWebpackPluginConfig, copyWebpackPluginOptions),
        new HtmlWebpackPlugin(htmlWebpackPluginConfig)
    ]

    // "Prettyprint" webpack config
    console.log('Webpack config: ' + JSON.stringify(config, null, 2));

    return config;
};
