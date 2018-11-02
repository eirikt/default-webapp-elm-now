# Default Webapp (Elm & ZEIT Now edition)
My default (opinionated/favourite) setup for web application development&mdash;a [single-page application (SPA)][spa] with client-side rendering, to be more precise.
(I guess that statement (the opinionated/favourite part) will remain true at least a year or so after the date of the last commit...)

This is first and foremost a personal writeup.
Yet, it will (maybe) end up like a "web project starter", a well-documented starting-point for a project, like a boilerplate&mdash;or just a basic tutorial.
I will take a somewhat "naive approach" when growing this codebase&mdash;arguing for and introducing features and tooling on the way as we go along, commit by commit, statement by statement&mdash;**stay tuned!**

A live version is hosted on [ZEIT Now][now], as [defaultwebapp.now.sh](https://defaultwebapp.now.sh).

...

This repository/project is sort of an update of my previous ["default webapp"][default-webapp-heroku] project, developed in 2014-2015.
(It is a kind of personal [code kata][kata].)
The most important change is that the "embedded" Node.js-based server API is gone.
I will try to use services maintained and hosted elsewhere only.
Many of the components from the client-side project are now replaced by other preferred components&mdash;e.g. like JavaScript/[React][react]/[Redux][redux] being replaced by [Elm][elm], [Grunt][grunt] being replaced by [webpack][webpack], [Heroku][heroku] being replaced by [ZEIT][zeit]'s [Now][now].
Also, some components are kept the same, like [Sass][sass], and probably the look & feel. (I am not a UX guy.)



* * *



OK, the very first thing to do, is getting our new webapp online;
Deploying the most basic version imaginable of our webapp to our hosting service of choice.

## Prerequisites
_To be very basic and specific_, the only prerequisites are:
- Some knowledge of English
- A computer, a steady supply of electric power, and network connectivity
- An email account and an email client&mdash;signed in

;-)

Then:
1. Install [Node.js][node] (The package manager tool, _npm_, is included).

   While at it&mdash;update npm (which release cycle is more frequent than Node.js'):

   ```bash
   npm install npm@latest --global
   ```

1. **Name your project/webapp**&mdash;first and foremost you need an official (natural language) name.
Then create:
   - a source-code-friendly name variant with no whitespace characters
   - a URL-friendly name variant with no whitespace characters, and lowercase characters only (hyphens allowed)
1. Using the new name, **create a project folder**&mdash;and at that location, open your command-line interface (CLI) of choice.

### ZEIT Now: Deployment to staging
Deploy/Publish your webapp using [ZEIT Now][now].
Let's get our first version online in an instance:
```bash
now
```
That fails&mdash;unknown command&mdash;install the ZEIT Now client:
```bash
npm install now@latest --global
```
Try again:
```bash
now
```
That fails&mdash;nothing to deploy&mdash;add a file to deploy (e.g. in a Windows Command Prompt):
```bash
TYPE NUL > index.txt
```
Try again:
```bash
now
```
If you don't have an account yet;
_Type in your email address_&mdash;_go to your email client_&mdash;_verify your email address_.
You now have a ZEIT Now account - also, you are now signed in.

Try again:
```
now
```
Give the deployment confirmation a '`y`' - and that's it!
**Your webapp is online** - the very, very first version of it that is...

Paste the given URL into a browser tab and have a look.
The deployed webapp is not particularly interesting&mdash;it is completely empty.
Ok, let us create our very first version with some actual content (again e.g. in a Windows Command Prompt):
```bash
ECHO Default Webapp - ZEIT Now edition (v0.1.1) > index.txt
```
Deploy (again):
```
now
```
### ZEIT Now: Deployment to production
ZEIT Now auto-generates a URL for the commissioned resource.
It is to be regarded as a staging area for your deployment.
_To fully put the webapp into production, then "alias" the staged area to your preferred URL_, like this:
```bash
now alias ${project folder name}-${auto-generated staging-id}.now.sh ${my-webapp-id}
```
E.g.:
```bash
now alias default-webapp-elm-now-olkrehlqms.now.sh defaultwebapp
```
### ZEIT Now: More convenient deployment to production
Creating all those staging-to-production aliasing commands can be cumbersome.
ZEIT Now has a configuration file&mdash;`now.json`&mdash;that helps out with that.
`now.json` has a property `alias` which will be assigned to the latest deployment when running `now alias` (with no arguments).
So, e.g., for automating deployment to my default webapp `defaultwebapp`:
```bash
ECHO {"alias":"defaultwebapp"} > now.json
```
Update "content":
```bash
ECHO Default Webapp - ZEIT Now edition (v0.1.2) > index.txt
```
Now, to deploy to staging, _and_ at the same time, create a production alias of the deployment, just:
```bash
now --public & now alias
```
Check out this easy-to-remember URL, <https://defaultwebapp.now.sh> in all browsers available.

Do notice that a certificate for the site is on-the-fly generated (thanks to [letsencrypt.org](https://letsencrypt.org)).



* * *


## Changelog
Growing the capabilities of this project setup, and the webapp itself&mdash;Commit by commit.

### v0.1: Establish project and deploy to ZEIT Now
The v0.1.x commits are:

#### v0.1.0: Empty static single resource [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/56863c2f0285c45f903f5028db06b076c0bbe298) | [deployment](https://file-pmqnhwkidm.now.sh) ]
(See above.)

#### v0.1.1: Static single plain text resource [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/1cedc30a49a1738c6f5f64938537b6cdc3757de6) | [deployment](https://file-iomajqiucy.now.sh) ]
(See above.)

#### v0.1.2: Single static web resource [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/62c30d234434e46637d7db8cc074de6602ee2d09) | [deployment](https://file-xkfehobloq.now.sh) ]
`text/plain` content type replaced by [`text/html`][html] content type&mdash;giving us quite a bit more possibilities.

#### v0.1.3: Text formatting [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/9eb77c484ea273caeec36a3c187bb824f28762bc) | [deployment](https://file-eswpsfmlgn.now.sh) ]
Very basic [HTML][html] tags added.
(HTML tutorials and WYSIWYG editor helpers are all over the web.)

#### v0.1.4: Convenient deployment to production [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/3d6cdd9c4944878ea9ce5e2c6ed36e79ffea95f4) ]
(See above.)

### v0.2: Project layout & Building with npm and webpack
The v0.2.x commits are:

#### v0.2.0: Project layout  [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/03ca6f91da131e70cdffaa3632a22a3e8ed754c4) | [deployment](https://build-epqechqdql.now.sh) ]
This commit includes:
- A designated source folder, `src`, should include most source files.
Left out at the project root are documentation, license, and project-wide configurations.
Also, the `index.html` file got some more [CSS][css] styling.

- A designated build folder, `build`, brings the need of a `.gitignore` file, ignoring that folder from version control.
Also, it mandates a change in the ZEIT Now configuration file `now.json`&mdash;where the deployment prefix (`name`) goes from default (project folder name) to `"name":"build"`. Read about the `now.json` configuration file [here][now-json].

- The only "build" step so far is just to copy the `src/index.html` file to the `build` folder&mdash;_manually for now_. (We definitely have to do something about that.)

#### v0.2.1: npm [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/39b770bd209c35f7504461d61c155ab448c4727b) ]
[_npm_][npm] originally was the "Node.js Package Manager", but is now become the de-facto tool for all web and JavaScript-based projects.
All project meta-information and package/component dependencies goes in its `package.json` project configuration file.

We start with a vanilla `package.json`, which we will extend in the following commits.

...

An alternative to npm is [yarn][yarn].
Yarn and npm has, at the moment, quite similar functionality&mdash;so being the "original" and bundled with Node.js, npm is the more idiomatic choice.

#### v0.2.2: License [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/a4b903be553be8549453ae82170ac0cf9165d0be) ]
Add a license file reflecting what is stated in `package.json`.
GitHub [recommends](https://help.github.com/articles/licensing-a-repository) putting a license file at the root of the source repositories, so let us go with that.

#### v0.2.3: webpack [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/5e02ffa656099dfe0599ad56061d880a343d406f) | [deployment](https://build-jzwvseuphj.now.sh) ]
[Webpack][webpack] is a powerful web application builder.
It builds a dependency graph which maps every module your project needs and generates one or more bundles. It has [four central concepts][webpack-concepts]:
1. _Entry_&mdash;An entry point indicates which module webpack should use to begin building out its internal dependency graph.
webpack will figure out which other modules and libraries that entry point depends on (directly and indirectly).

   Default is `./src/index.js`

1. _Output_&mdash;The output property tells webpack where to emit the bundles it creates and how to name these files.

   Default is `./dist/main.js`

1. _Loaders_&mdash;Out of the box, webpack only understands JavaScript files.
Loaders allow webpack to process other types of files and convert them into valid modules that can be consumed by your application and added to the dependency graph.

   Loaders have two properties in your webpack configuration:
   - `test`, a [regular expression][regex] identifying which file(s) that are to be transformed
   - `use` indicates which loader should be used to do the transforming of the files identified by the `test` entries

1. _Plugins_&mdash;While loaders are used to transform certain types of "resource modules", plugins can be leveraged to perform a wider range of tasks like bundle optimization, asset management and injection of environment variables.

...

Alternatives to webpack are [Grunt][grunt], [Gulp][gulp], and [Parcel][parcel].
I must admit I am not a huge webpack fan&mdash;I find the API semantics a bit confusing and overly complicated.
Anyway, webpack is clearly the idiomatic build tool choice these days.

###### Our first config
As our first _entry_, we direct webpack to... our only source file:
```javascript
entry: path.join(__dirname, 'src/index.html'),
```

As our first _output_, we direct webpack to our build folder:
```javascript
output: {
    path: path.join(__dirname, 'build'),
    filename: 'index.js',
}
```

In this first `webpack.config.js` we are using webpack for what it is not intended for&mdash;simple file copying.
That is why we are using a _plugin_, `ignore-emit-webpack-plugin`, to simply ignore and suppress the emitting of the webpack bundle `ìndex.js`, and just using the _loader_ `file-loader` to copy the `index.html` to our `build` folder.

We will be using webpack more idiomatically in the subsequent commits.

###### As a build script
Add our first npm script/task/command in `package.json`:
```json
"scripts": {
    "build": "webpack"
},
```

Install and add webpack as a development dependency in `project.json`:
```bash
npm install webpack --save-dev
npm install webpack-cli --save-dev

npm install file-loader --save-dev
npm install ignore-emit-webpack-plugin --save-dev
```
And run our scripted new task:
```bash
npm run build
```
#### v0.2.4: Semantic project tasks [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/93a7c1bb1b81b2b3ffb05a9c529d1c91678bdd0f) | [deployment](https://build-vwmktnocgx.now.sh) ]
In our `package.json`, (simple) scripts for project tasks/phases are added&mdash;chronologically:
1. _setup_
1. _clean_
1. _build_
1. _deploy to staging_
1. _deploy to production_

At all times we can list all npm scripts/tasks/commands with:
```bash
npm run
```
So from now on we can, e.g. deploy (from scratch) to staging with a single command:
```bash
npm run deploy
```
### v0.3: Using Elm
[Elm][elm] is a statically typed, pure functional programming language.
By that, it brings (by default, out-of-the-box) <a name="fp">good stuff</a> like:
- [Immutability](https://en.wikipedia.org/wiki/Immutable_object)&mdash;shared mutable state is just a nightmare in computer applications

- [Sum types](https://en.wikipedia.org/wiki/Tagged_union)&mdash;which together with the enforced static type checking eliminates [null references](https://en.wikipedia.org/wiki/Null_pointer)

- Partial function application&mdash;which enables [currying](https://en.wikipedia.org/wiki/Currying), which facilitates creating highly reusable "configurable" functions

Elm [transpiles](https://en.wikipedia.org/wiki/Source-to-source_compiler) to ECMAScript 5. Hence, without any further transpiling, leaves Internet Explorer 8 and all those even more ancient browsers behind.

Well, [install](https://guide.elm-lang.org/install.html) Elm.

...

The v0.3.x commits are:

#### v0.3.0: Building an Elm-based project with webpack [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/f612d9278c2cd2af07f5b2ef0db81efe9ac12732) | [deployment](https://build-ysgfanfbnz.now.sh) ]
First we remove the `src/index.html` file.
It is replaced by the [HTML Webpack Plugin][html-webpack-plugin], which is now responsible for producing the `index.html` output file.
In this first version we just let the HTML Webpack Plugin do its default thing:
```javascript
plugins: [
    new HtmlWebpackPlugin()
]
```
The default behaviour is to generate a vanilla `index.html` in which our configured `entry` is loaded as its sole body content.
The `entry` in `webpack.config.js` is changed to:
```javascript
entry: path.join(__dirname, 'src/index.js'),
```
(It is the default `entry` in webpack so we do not actually have to include it in our `webpack.config.js`. Yet we include it for completeness.)

So, we add a `src/index.js` file, in which we do two things:

1. Load all Elm sources, and transpile it to JavaScript, including the Elm runtime:
   ```javascript
   const app = require('./elm/Main.elm');
   ```
   This little statement is JavaScript code that will be executed in the browsers.
   For the small amounts of JavaScript we will use, we will, as a principle, use modern JavaScript.
   Here we are using ECMAScript 2015 features&mdash;which means that Internet Explorer 10 and older browsers at the moment are unsupported in this webapp.
   Support for older browsers can be achieved by an extra transpiling step (which we will introduce in later commits)&mdash;but only add it if the customer explicitly asks for/demands it!

   ###### Elm-based content
   We have to add the requested `src/elm/Main.elm` source file. e.g.:
   ```elm
   import Html
   main = Html.text "Default Webapp - Elm & ZEIT Now edition [v0.3.0]"
   ```
   This is the Elm version of "Hello World", which just emits an escaped text.
   (A core Elm package is imported and used, [elm/html/Html][elm-html-html].)

   ###### Elm-webpack-loader
   To parse and transpile Elm to JavaScript, we need to add a webpack loader, the [Elm loader][elm-webpack-loader] (`elm-webpack-loader`).
   In `webpack.config.js`, add:
   ```javascript
   module: {
       rules: [{
           test: /\.elm$/,
           use: [{
               loader: 'elm-webpack-loader'
           }]
       }]
   }
   ```
   It will transpile the Elm source code to ECMAScript 5 source code using the Elm standard `make` tool (which is included in the standard Elm install).
   Also, the Elm ECMAScript 5-based runtime will be added to the generated code.
   More on the Elm runtime later.

1. Execute this generated JavaScript, and add it to a DOM element we know is present in the generated `index.html`.
   ```javascript
   app.Elm.Main.init({
       node: document.getElementsByTagName('body')[0]
   });
   ```

We are ready for the new build.
What remains is updating our npm dependencies:
```bash
npm uninstall file-loader
npm uninstall ignore-emit-webpack-plugin

npm install elm-webpack-loader --save-dev
npm install html-webpack-plugin --save-dev
```
And then build:
```bash
npm run build
```
...

Finally, update the generated `elm.json` with `src/elm` instead of just `src`, and add the new output folder `elm-stuff` in the `.gitignore` file.

#### v0.3.1: webpack mode [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/9da7cc3c5eb0139b0599af6e857b2466fded5590) | [deployment](https://build-ndysvvuckb.now.sh) ]
Webpack has two modes, "development" and "production".
By default, "production" is chosen.
In "production" mode webpack does several tasks preparing the build for deployment to a production environment, e.g. minification.
So, while developing, we explicitly choose "development".
Add the mode in `webpack.config.json`:
```javascript
const config = {
    mode: 'development',
    ...
}
```

#### v0.3.2: Using an HTML template [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/47627c4b9c371923e890611c8a6a3aab0ce6d6cc) | [deployment](https://build-ahhwscxgwo.now.sh) ]
The [HTML Webpack Plugin][html-webpack-plugin] can generate the `index.html` from scratch, as it is doing now.
But also, it can create it based on a _template file_.
That is preferable, as it gives us both more control and convenience.
Add the `template` option in the HTML Webpack Plugin configuration:
```javascript
plugins: [
    new HtmlWebpackPlugin({
        template: path.join(__dirname, 'src/index.template.html')
    })
]
```
We must now provide the `src/index.template.html` file, e.g. a very barebone one:
```html
<div id="elmContainer"/>
```
The `src/index.js` must be updated with
```javascript
app.Elm.Main.init({
    node: document.getElementById('elmContainer')
});
```
The HTML element `elmContainer` will be _replaced_ by the Elm-generated content.

### v0.4: Styling with Sass
Choosing a strategy for styling the webapp is not straightforward any more,
especially when one is not well-wandered in the UX domain.

As we have chosen Elm as our primary tool for creating the webapp, it would be natural to go with Elm's own type-safe, CSS-wrapping, styling alternative&mdash; [elm-css](https://package.elm-lang.org/packages/rtfeldman/elm-css/latest).
That might well be what we end up doing in the end, but I feel that the present solution for styling works well enough.
It is a separate, modular solution for the "look & feel" concern of the webapp.
And when using a CSS extension like [Sass][sass] (or specifically SCSS, "Sassy CSS"), we have a powerful technical foundation to work with.
Sass supports niceties like variables, nesting, inheritance, mixins, and imports.
Also, when adhering to ad-hoc techniques for improving reusability like [BEM][bem]&mdash;Block Element Modifier, and maybe also [SMACSS][smacss]&mdash; we are well-equipped for safe and convenient styling.
(Of course, sticking to Sass will also preserve the connection to my previous ["default webapp"][default-webapp-heroku] project&mdash;making the comparison between the two solutions easier.)

...

Alternatives to Sass are standard CSS, and [Less][less] (still, maybe).
Also, encapsulation and scoping of CSS with e.g. [CSS Modules][css-modules] or [CSS Blocks][css-blocks] I have chosen to skip for the moment.
Another alternative is to go with a complete styling framework like [Twitter Bootstrap][twitter-bootstrap] (Elm port [here](https://github.com/aforemny/elm-mdc)) or [Google Material Design][google-material-design] (Elm port [here](http://elm-bootstrap.info)).
Those seem too invasive for this minimalistic and basic setup.

...

The v0.4.x commits are:

#### v0.4.0: Sass with webpack [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/a870fbf621de8f75e3dc35f562c0518cf8319c85) | [deployment](https://build-pwrjvwrvzv.now.sh) ]
As Sass/CSS is a completely separate (domain-specific) programming language, it must have its own entry in webpack configuration:
```javascript
entry: [
    path.join(__dirname, 'src/index.js'),
    path.join(__dirname, 'src/scss/style.scss')
],
```
...with a loader setup:

```javascript
test: /\.scss$/,
use: [{
    loader: 'style-loader'
}, {
    loader: 'css-loader'
}, {
    loader: 'sass-loader'
}]
```
The [Sass Loader][sass-webpack-loader] turns `style.sass` into plain CSS.
The [CSS Loader][css-webpack-loader] takes the CSS file and returns the CSS with `import`s and `url(...)` resolved via webpack's require functionality.
The [Style Loader][style-webpack-loader] inserts those styles into the HTML page, and by that into the browser's DOM.
(Do notice that webpack loaders are applied from the bottom up.)

For the new `src/scss/style.scss` we are starting with a trivial and silly font declaration just to see that things are working:
```sass
@charset "UTF-8";
body { font-family: Comic Sans MS, cursive, sans-serif; }
```
...

What remains is updating our npm dependencies:
```bash
npm install style-loader --save-dev
npm install css-loader --save-dev
npm install sass-loader --save-dev
npm install node-sass --save-dev
```
And then build:
```bash
npm run build
```

### v0.5: Static code analysis
Before starting on the actual building of the visual parts of the webapp, let us have a look at tooling.

Establishing some, uhm, common "values" for the codebase is helpful for the alleged _organizational scaling_.
Manual code reviews are fine and well, but externalizing as much of coding concerns as possible is preferable&mdash;"objective truths" tend not to create grudges in the same way "subjective truths" may.
Automated feedback is also preferable over manual tasks, always.

Elm gives us static code analysis in the form of strict, enforced static type checking and enforcement.
Let us extend the build-time checking with things like:
- Code style
- Coding idioms
- Third-party versions
- Third-party licenses

These are concerns that can be _enforced_, e.g. by tools like [git-hooks-plus](https://www.npmjs.com/package/git-hooks-plus),
or quite easy with the [husky](https://github.com/typicode/husky)/[lint-staged](https://github.com/okonet/lint-staged) combo.
A clear candidate for such enforcement is Elm source code formatting, which has its own established code style rules.
Still, I choose not to include that kind of automation yet, maybe later.

...

Alternatives to the internal tools below are the plethora of external services, e.g. those available as [GitHub Apps](https://github.com/marketplace/).
As none of those supports Elm (for some strange reason), let us use local tools for now.

...

The v0.5.x commits are:

#### v0.5.0: `npm audit`, for known security issues [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/7c93447c1082a4e12dec6634d9e722f972c6a085) ]
npm now includes a tool for running security audits, `npm audit`.
Let us add it as our `check:1` task.

#### v0.5.1: `npm-check`, for third-party component versions [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/090dba3c56bdcd579a5049f7b5c764f80a7b26b1) ]
npm also includes a tool for checking versions for third-party dependencies, `npm outdated`.
Yet, the external package [`npm-check`](https://www.npmjs.com/package/npm-check) does a slightly better job of presenting its findings.
(Its 'unused dependency' check does not yet support webpack though, but I am sure [it will soon](https://github.com/dylang/npm-check/issues/304)...)
```bash
npm install npm-check --save-dev
```
Let us add it as our `check:2` task.

#### v0.5.2: `npm update` [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/3f68c3947575b0d3b44a637ceeff3ae8d482c10a) ]
Based on our newly created task:
```bash
npm run check:2
```
It suggested, at the time of writing, these packages to be upgraded:
```bash
npm update webpack
npm update webpack-cli
npm update node-sass
npm update style-loader
```

#### v0.5.3: `elm-analysis`, for Elm code style and idioms [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/9c74b615406f472d1c195379beaa2aa2eef065fd) ]
[Elm Analyse][elm-analyse] analyses your Elm code, identifies deficiencies and applies best practices.
```bash
npm install elm-analyse --save-dev
```
Let us add it as our `check:3` task.

**NB!** As of now, Elm Analyse [does not yet support Elm v0.19](https://github.com/stil4m/elm-analyse/issues/176)!
So this task is not applicable until it does.
But also, Elm Analyse has to replace its outdated [open](https://github.com/jjrdn/node-open) dependency, otherwise we sadly have to ditch this excellent tool.

#### v0.5.4: `elm-format`, for Elm code style [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/db65850d4f9c36ac4807cbb2d2628c61a4734b91) ]
Elm has included and established some modern features, making it stand out amongst programming languages.
One of them is _enforced [semantic versioning][semver]_.
Elm detects all API changes automatically (thanks to its type system), and uses that information to guarantee that every single Elm package follows semantic versioning precisely.
Another "feature" is _official and well-established code style_.
It is not enforced out-of-the-box, but can be automatically applied by the [elm-format][elm-format] tool.

Add it:
```bash
npm install elm-format --save-dev
```
By the way, there is really no reason not to add it as a global package:
```bash
npm install elm-format --global
```
And create a task in `package.json` that formats all our Elm code:
```json
"elm:format": "elm-format src/elm/ --yes",
```

#### v0.5.5: `sass-lint`, for Sass code style and idioms [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/096ad5ce10d9ef936a4f04c1ae9e257ac1851d66) ]
The other main programming languages involved in our little project is Sass.
Sass has [linters](https://en.wikipedia.org/wiki/Lint_(software)) too, e.g. [Sass Lint][sass-lint]:
```bash
npm install sass-lint --save-dev
```
Sass Lint can be configured from a `.sass-lint.yml` or `.sasslintrc` file in your project.
We will not do that yet&mdash;rather we will just follow the [default configuration](https://github.com/sasstools/sass-lint/blob/master/lib/config/sass-lint.yml).

#### v0.5.6: EditorConfig, for common IDE behaviour [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/bc8d70d1772dc84aee815250b4de7f4782ca29ae) ]
A nice, beloved text editor (or even a full-blown, hopefully not full-bloated, integrated development environment (IDE)) is an integral part of a software developer's life.
Even we are somewhat restricting individual preferences in this setup, the IDE should be free of choice.
To "preserve organizational scaling" concerns, we are creating a common ground for IDEs with [EditorConfig](https://editorconfig.org), IDE-agnostic editor configurations.
That consolidates e.g. issues like _[whitespace](https://en.wikipedia.org/wiki/Whitespace_character) handling_&mdash;important for avoiding unnecessary version differences.

So, the text editors/IDEs used by project developers should support EditorConfig internally or via a plugin.
The list of text editors/IDEs having support for EditorConfig is to be found [here](https://editorconfig.org/#download).
I use [Atom][atom] with the [EditorConfig plugin](https://github.com/sindresorhus/atom-editorconfig) installed.

### v0.6: Live reloading & Hot reloading
Before (finally) starting on the actual building of the visual parts, let us set up a smooth development environment where the goal is fast and frequent micro-iterations, making short feedback loops possible.
The principle of short feedback loops when developing are discussed e.g. in Brett Victor's excellent [talk](https://vimeo.com/36579366), in which he talks about the necessity of having an immediate connection with what you create.

...

The v0.6.x commits are:

#### v0.6.0: Developing with _live reloading_ [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/e41d1b22a9ba6d70cd9d4dab5c204282002811f2) ]
"Live reloading" means that the entire webapp is reloaded for every change we do in our codebase.
It is like automatic pushing of `F5`.

This is easily implemented by using webpack's [DevServer](https://github.com/webpack/webpack-dev-server).

Add it as a script/task/command in `package.json`:
```json
"scripts": {
    ...
    "dev": "webpack-dev-server",
    ...
},
```
Install it:
```bash
npm install webpack-dev-server --save-dev
```
...and run it:
```bash
npm run dev
```
Now, go to <http://localhost:8080>.
Check if live reloading works&mdash;all files in `src` folder should be monitored for changes.

#### v0.6.1: Even better, developing with _hot reloading_ [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/d15f7c8878781b99128b3d4ec0fc5f6abc98b231) ]
"Hot reloading" means that just the DOM elements that have altered content are being updated (by directly manipulating the DOM).
That leads to a more "smooth" developer experience than "live reloading" provides.
Also, this is how the actual user experience will be, because this is accomplished by the one-directionally data flow which Elm utilizes.

This is easily implemented by using [elm-hot-webpack-loader](https://github.com/klazuka/elm-hot-webpack-loader).

Add a `--hot` flag to the `dev` task:
```json
"dev": "webpack-dev-server --hot",
```
In `webpack.config.js`, add:
```javascript
{ loader: 'elm-hot-webpack-loader' }
```
...as the first `use` element for Elm files.

Also, while at it, add webpack DevServer config at the bottom:
```javascript
devServer: {
    port: 9000,
    overlay: {
        warnings: true, // NB! Very strict indeed - ok at project start
        errors: true
    }
},
```
(Port 9000 stands out better as 'dev' than 8080, I think.)
Overlays for compiler warnings and errors are feedback as immediate as it gets.

Install it:
```bash
npm install elm-hot-webpack-loader --save-dev
```
...and run it:
```bash
npm run dev
```
Now, go to <http://localhost:9000>.
Check if live reloading works (use F12)&mdash;all files in `src` folder should be monitored for changes.

NB! Hot reloading does not work in any version of Internet Explorer.

#### v0.6.2: Building for production [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/f11013ca859786f3f951c5fbd94a8d33bbee82e7) ]
Now, when building the solution with:
```bash
npm run build
```
...the main deployable artefact `index.js` ends up being 121KB&mdash;a quite large "Hello World"!
That is all fine and well when developing, but for production artefacts which is going over the wire, they need to be as small as possible.
So let us minify the artefacts when building for production.

Firstly, remove the hardcoded build mode in `webpack.config.js`:
```javascript
mode: 'development',
```
Then add the build mode as arguments to webpack:
```json
"build:development": "webpack --mode=development",
"build:production": "webpack --mode=production",
```
There are several ways to implement build modes in webpack.
One strategy is to have separate webpack config files, typically one for development and one for production.
Here, we are using another strategy; One common config file in which we manipulate the configuration depending on the build mode provided.
We can do this by intercepting (via Node.js/CommonJS mechanisms) the building of the webpack configuration object, e.g. like this:
```javascript
module.exports = (env, argv) => {
    console.log('Webpack build mode: ' + argv.mode);

    if (argv.mode === 'production') {
        ...
    } else {
        // 'development'
        ...
    }
    ...

    // "Prettyprint" webpack config
    console.log('Webpack config: ' + JSON.stringify(config, null, 2));

    return config;
}
```
The webpack config file with this look a bit more messy/imperative though...

### v0.7: HTML5 Boilerplate / Building the site
Then, finally, we have the needed structure in place&mdash;we are ready for the actual building of the visual parts of the webapp again.

_TODO: ..._

### v0.x: The Elm Architecture
_TODO: ..._

### v0.x: Elm: Communicating with the outside world
_TODO: ..._

### v0.x: Elm: Testing
_TODO: ..._

### v0.x: Elm: "Offline first", using Service Workers
_TODO: ..._

### v0.x: Elm: "Mobile App" / Progressive Web Applications
_TODO: ..._

### v0.x: Elm: Utilizing [FaaS](https://en.wikipedia.org/wiki/Function_as_a_service) resources
_TODO: ..._

### v0.x: Elm: "Desktop App" / [Electron][electronjs]
_TODO: ..._

### v0.x: Immutable infrastructure / A build pipeline using containers
_TODO: ..._

### v0.x: Chaos engeneering / Runtime forensics
_TODO: ..._

### v0.x: ...
_TODO: ..._



* * *



## Webapp deployment history

Latest greatest, always: <https://defaultwebapp.now.sh>

A list of deployments with visual differences:
- v0.4.0: <https://build-pwrjvwrvzv.now.sh>

- v0.3.2: <https://build-ahhwscxgwo.now.sh>
- v0.3.1: <https://build-ndysvvuckb.now.sh>
- v0.3.0: <https://build-ysgfanfbnz.now.sh>

- v0.2.4: <https://build-vwmktnocgx.now.sh>
- v0.2.3: <https://build-jzwvseuphj.now.sh>
- v0.2.0: <https://build-epqechqdql.now.sh>

- v0.1.3: <https://file-eswpsfmlgn.now.sh>
- v0.1.2: <https://file-xkfehobloq.now.sh>
- v0.1.1: <https://file-iomajqiucy.now.sh>
- v0.1.0: <https://file-pmqnhwkidm.now.sh>




[default-webapp-heroku]: https://github.com/eirikt/default-webapp-heroku
[serveless-framework]:https://en.wikipedia.org/wiki/Serverless_Framework
[serverless-computing]: https://en.wikipedia.org/wiki/Serverless_computing
[kata]: https://en.wikipedia.org/wiki/Kata_(programming)
[technical-debt]: https://en.wikipedia.org/wiki/Technical_debt
[spa]: https://en.wikipedia.org/wiki/Single-page_application
[responsive]: https://en.wikipedia.org/wiki/Responsive_web_design
[pwa]: https://en.wikipedia.org/wiki/Progressive_Web_Apps

[ci-cd]: https://en.wikipedia.org/wiki/CI/CD
[ci]: https://en.wikipedia.org/wiki/Continuous_integration
[cd]: https://en.wikipedia.org/wiki/Continuous_delivery
[continual]: https://en.wikipedia.org/wiki/Continual_improvement_process

[heroku]: https://www.heroku.com
[zeit]: https://zeit.co
[now]: https://zeit.co/now
[now-json]: https://zeit.co/blog/now-json

[atom]: https://atom.io
[electronjs]: https://electronjs.org

[ml-family]: https://en.wikipedia.org/wiki/ML_(programming_language)
[elm]: http://elm-lang.org
[elm-webpack-loader]: https://github.com/elm-community/elm-webpack-loader
[elm-html-html]: https://package.elm-lang.org/packages/elm/html/latest/Html
[elm-css]: https://package.elm-lang.org/packages/rtfeldman/elm-css/latest
[elm-format]: https://github.com/avh4/elm-format
[elm-analyse]: https://stil4m.github.io/elm-analyse/

[semver]:https://semver.org
[regex]: https://en.wikipedia.org/wiki/Regular_expression

[html]: https://en.wikipedia.org/wiki/HTML
[css]: https://en.wikipedia.org/wiki/Cascading_Style_Sheets
[sass]: https://sass-lang.com
[less]: http://lesscss.org
[css-modules]: https://github.com/css-modules/css-modules
[css-blocks]: https://css-blocks.com
[bem]: http://getbem.com
[smacss]: https://smacss.com
[sass-webpack-loader]: https://github.com/webpack-contrib/sass-loader
[css-webpack-loader]: https://github.com/webpack-contrib/css-loader
[style-webpack-loader]: https://github.com/webpack-contrib/style-loader
[sass-lint]: https://github.com/sasstools/sass-lint
[twitter-bootstrap]: http://getbootstrap.com
[google-material-design]: https://material.io

[grunt]: https://gruntjs.com
[gulp]: https://gulpjs.com
[parcel]: https://parceljs.org
[webpack]: https://webpack.js.org
[webpack-concepts]: https://webpack.js.org/concepts/
[html-webpack-plugin]: https://github.com/jantimon/html-webpack-plugin

[node]: https://nodejs.org
[npm]: https://www.npmjs.com
[package-json]: https://docs.npmjs.com/files/package.json
[yarn]: https://yarnpkg.com
[react]: https://reactjs.org
[redux]: https://redux.js.org
