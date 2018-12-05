const path = require('path');
const webpack = require('webpack');
const CopyWebpackPlugin = require('copy-webpack-plugin')
const HtmlWebpackPlugin = require('html-webpack-plugin');

const packageJson = require('./package.json');

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

let definePluginConfig = {
    VERSION: JSON.stringify(packageJson.version),
    TIMESTAMP: JSON.stringify(new Date().getTime()),
    MODE: JSON.stringify('Development')
};

let copyWebpackPluginConfig = [
    {
        from: 'src/assets/favicons/**/*',
        flatten: true
    }
];
let copyWebpackPluginOptions = {}

let htmlWebpackPluginConfig = {
    template: path.join(__dirname, 'src/index.template.html'),
    templateParameters: {
        description: packageJson.description,
    }
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

        console.log('Removing \'Development\' build mode label... Absence of build mode means \'Production\'');
        definePluginConfig.MODE = null;

    } else { // => 'development'
        console.log('Adding Elm\'s debug overlay to output...');
        config.module.rules[0].use[1].options = {
            debug: true
        };
    }

    config.plugins = [
        new webpack.DefinePlugin(definePluginConfig),
        new CopyWebpackPlugin(copyWebpackPluginConfig, copyWebpackPluginOptions),
        new HtmlWebpackPlugin(htmlWebpackPluginConfig)
    ]

    // "Prettyprint" webpack config
    //console.log('Webpack config: ' + JSON.stringify(config, null, 2));

    return config;
};
