# Default Webapp (Elm & ZEIT Now edition)
My default (opinionated/favourite) setup for web application development&mdash;a [single-page application (SPA)][spa] with client-side rendering, to be more precise.
(I guess that statement (the opinionated/favourite part) will remain true one year or so after the date of the last commit...)

This is first and foremost a personal write-up.
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
- Some knowledge of English ;-)
- A computer, a steady supply of electric power, and network connectivity ;-)
- An email account and an email client&mdash;signed in

Then:
1. Install [Node.js][node] (The package manager tool, _npm_, is included).

   While at it&mdash;update npm (npm's release cycle is more frequent than Node.js'):
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

Do notice that a certificate for the site is generated on-the-fly&mdash;thanks to [letsencrypt.org](https://letsencrypt.org)).
(This enables [HTTPS][https] which facilitates encryption of data sent over the wire, and server-side authentication.)

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
Now, to deploy to staging, _and_ create a production alias of the deployment, execute:
```bash
now --public
now alias
```
Check the easy-to-remember URL, <https://defaultwebapp.now.sh> in all browsers available.


* * *


## Changelog
Growing the capabilities of this project setup, and the webapp itself&mdash;commit by commit.

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
(HTML tutorials and  [WYSIWYG][wysiwyg] editor helpers are all over the web.)

#### v0.1.4: Convenient deployment to production [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/3d6cdd9c4944878ea9ce5e2c6ed36e79ffea95f4) ]
(See above.)

### v0.2: Project layout & Building with npm and webpack
The v0.2.x commits are:

#### v0.2.0: Project layout  [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/03ca6f91da131e70cdffaa3632a22a3e8ed754c4) | [deployment](https://build-epqechqdql.now.sh) ]
This commit includes:
- A designated source folder, `src`, should include most source files.
Left out in the project root are documentation, license, and project-wide configurations.
Also, the `index.html` file got some more [CSS][css] styling.

- A designated build folder, `build`, brings the need of a `.gitignore` file, ignoring that folder from version control.
Also, it mandates a change in the ZEIT Now configuration file `now.json`&mdash;where the deployment prefix (`name`) goes from default (project folder name) to `"name":"build"`. Read about the `now.json` configuration file [here][now-json].

- The only "build" step so far is just to copy the `src/index.html` file to the `build` folder&mdash;_manually for now_. (We definitely have to do something about that.)

#### v0.2.1: npm [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/39b770bd209c35f7504461d61c155ab448c4727b) ]
[_npm_][npm] originally was the "Node.js Package Manager", but is now become the de-facto tool for all web and JavaScript-based projects.
All project meta-information and package/component dependencies goes in its `package.json` project configuration file.

We start with a default `package.json`, which we will extend in the following commits.

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
I must admit I am not a huge webpack fan.
I find the API semantics a bit confusing and overly complicated.
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
By that, it brings (by default, out-of-the-box) good stuff like:
- [Immutablity][immutability]&mdash;shared mutable state is just a nightmare in computer applications

- [Sum types][sum-type]&mdash;which together with the enforced static type checking eliminates [null references](https://en.wikipedia.org/wiki/Null_pointer)

- [Partial function application][partial-application]&mdash;which facilitates creating highly reusable "configurable" functions

- [Parametric polymorphism][parametric-polymorphism]&mdash;enabling compact, yet expressive and precise logic

(For an intro to functional programming, go e.g. [here---my own attempt of clarifying concepts and terms, from the ground up](https://functionalprogramming.now.sh/1-functions-and-values.html). **NB! Work in progress.**)

Elm [transpiles](https://en.wikipedia.org/wiki/Source-to-source_compiler) to ECMAScript 5. Hence, without any further transpiling, leaves Internet Explorer 8 and all those even more ancient browsers behind.

[Install](https://guide.elm-lang.org/install.html) Elm.

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
   Support for older browsers can be achieved by an extra transpiling step (which we will introduce in later commits)&mdash;**but only add it if the customer explicitly asks for/demands it when you inform them about this choice**.

   ###### Elm-based content
   We have to add the requested `src/elm/Main.elm` source file. e.g.:
   ```elm
   import Html
   main = Html.text "Default Webapp - Elm & ZEIT Now edition [v0.3.0]"
   ```
   This is the Elm version of "Hello World", which just emits an HTML-escaped text.
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
   Also, the _Elm ECMAScript 5-based runtime_ will be added to the generated code.
   More on the Elm runtime later.

1. Execute this generated JavaScript, and add it to a browser [DOM][dom] element we know is present in the generated `index.html`.
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

As we have chosen Elm as our primary tool for creating the webapp, it would be natural to go with Elm's own type-safe, CSS-wrapping, styling alternative&mdash;[elm-css](https://package.elm-lang.org/packages/rtfeldman/elm-css/latest).
That might well be what we end up doing in the end, but I feel that the present solution for styling works well enough.
It is a separate, modular solution for the "look & feel" concern of the webapp.
And when using a CSS extension like [Sass][sass] (or specifically SCSS, "Sassy CSS"), we have a powerful technical foundation to work with.
Sass supports niceties like variables, nesting, inheritance, mixins, and imports.
Also, when adhering to ad-hoc techniques for improving reusability like [BEM][bem]&mdash;Block Element Modifier, and maybe also [SMACSS][smacss]&mdash;we are well-equipped for safe and convenient styling.
(Of course, sticking to Sass will also make it easier to compare this codebase to my previous ["default webapp"][default-webapp-heroku] project.)

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
The [Style Loader][style-webpack-loader] inserts those styles into the HTML page, and by that into the browser DOM.
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

Establishing some, uhm, common "values" for the codebase is helpful.
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

...

Also, Elm Analyse supports web reports via its internal HTTP server.
```bash
npm run elm:analyse-gui
```
I have some problems getting the automatic opening of http://localhost:3000 to work though...
If the browser does not show up, run:
```bash
npm run elm:analyse-gui-open
```

...

(Elm Analyse has to replace its outdated and [blacklisted](https://www.npmjs.com/advisories/663) [open](https://github.com/jjrdn/node-open) dependency, otherwise we sadly have to ditch this nice tool.)

#### v0.5.4: `elm-format`, for Elm code style [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/db65850d4f9c36ac4807cbb2d2628c61a4734b91) ]
Elm has included and established some modern features, making it stand out amongst programming languages.
One of them is _enforced [semantic versioning][semver]_.
Elm detects all API changes automatically (thanks to its type system), and uses that information to guarantee that every single Elm package follows a semantic versioning scheme.
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
```javascript
"scripts": {
    ...
    "elm:format": "elm-format src/elm/ --yes",
    ...
},
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
A nice, beloved text editor (or even a full-blown, hopefully not bloated, integrated development environment (IDE)) is an integral part of a software developer's life.
Even we are somewhat restricting individual preferences in this setup, the IDE should be free of choice.
For "organizational scaling" concerns, we are creating a common ground for IDEs with [EditorConfig](https://editorconfig.org), IDE-agnostic editor configurations.
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
It is like automatic pushing of <kbd>F5</kbd>.

This is easily implemented by using webpack's [DevServer](https://github.com/webpack/webpack-dev-server).

Add it as a script/task/command in `package.json`:
```javascript
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
Check if live reloading works&mdash;all files in `src` folder should now be monitored for changes.

#### v0.6.1: Even better, developing with _hot reloading_ [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/d15f7c8878781b99128b3d4ec0fc5f6abc98b231) ]
"Hot reloading" means that just the DOM elements that have altered content are being updated (by directly manipulating the DOM).
That leads to a more "smooth" developer experience than "live reloading" provides.
Also, this is how the actual user experience will be, because this is accomplished by the one-directional data flow which Elm utilizes.

This is easily implemented by using [elm-hot-webpack-loader](https://github.com/klazuka/elm-hot-webpack-loader).

Add a `--hot` flag to the `dev` task:
```javascript
"scripts": {
    ...
    "dev": "webpack-dev-server --hot",
    ...
},
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
(Port `9000` stands out better as 'development' than `8080`, I think.)
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
Check if live reloading works (use <kbd>F12</kbd>)&mdash;all files in `src` folder should be monitored for changes.

**NB!** Hot reloading does not work in any version of Internet Explorer.

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
```javascript
"scripts": {
    ...
    "build:development": "webpack --mode=development",
    "build:production": "webpack --mode=production",
    ...
},
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

Now, the main deployable artefact `index.js` is 35KB&mdash;a more tangible and acceptable size.

### v0.7: Building the site
Then, finally, we have the needed structure in place&mdash;we are ready for the actual building of the visual parts of the webapp again.

We are starting out, purposely, quite barebone with obviously deficient HTML.
First, let us bump the quality up a notch for that.
Then, we can create a page design "skeleton".

...

The v0.7.x commits are:

#### v0.7.0: Valid HTML [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/1df6a57c2fab1d5657a941ab92e6e0d07d52d000) | [deployment](https://build-cbqmulqgus.now.sh) ]
Let us start with the easiest way of getting feedback on the quality of the HTML we send to the browsers/clients&mdash;the browser themselves.
By pushing <kbd>F12</kbd> and have a look at the Console pane, we see complaints of out current HTML structure;
Things like:
```
HTML1527: DOCTYPE expected. Consider adding a valid HTML5 doctype: “!DOCTYPE html>”.
index.html (1,1)

HTML1500: Tag cannot be self-closing. Use an explicit closing tag.
index.html (1,1)
```
Let us fix those.

#### v0.7.1: Favicons [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/1dbc3f4f682377d65425e2b9f9065bae766c30a0) | [deployment](https://build-jexriqbedd.now.sh) ]
Some browsers also complain about missing favicon, giving us an ugly `404` in the browser console.

The days of just having a tiny `favicon.ico` file are gone.
Several image formats and types but also configuration files (e.g.: `browserconfig.xml` and `manifest.json`) are now necessary to have a nice favicon on all the available devices out there.

First, generate your favicon files using the excellent generator at <https://realfavicongenerator.net>.
It provides all the necessary files.
Also it generates code snippets for updating our `<head>` element.

For my favicon, I just picked one from <https://favicon.io/emoji-favicons/> and ran it through the favicon generator.

...

Now we are back to using webpack for file copying...

In `webpack.config.js`&mdash;declare the plugin:
```javascript
const CopyWebpackPlugin = require('copy-webpack-plugin')
```
Add modifiable config and option objects:
```javascript
let copyWebpackPluginConfig = [
    {
        from: 'src/assets/favicons/**/*',
        flatten: true
    }
];
let copyWebpackPluginOptions = {}
```
And add the plugin to the final plugin array of our webpack config:
```javascript
config.plugins = [
    new CopyWebpackPlugin(copyWebpackPluginConfig, copyWebpackPluginOptions),
    new HtmlWebpackPlugin(htmlWebpackPluginConfig)
]
```
...

Install it and update our npm dependencies:
```bash
npm install copy-webpack-plugin --save-dev
```
And then build:
```bash
npm run build
```

#### v0.7.2: Outdated browser warning [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/d6456cfcf71be5357795262f07ba0d8fce2eef99) | [deployment](https://build-evhjfounxv.now.sh) ]
As we are not supporting certain older browser, it is polite to inform users of that.
Copied from [HTML5 Boilerplate](https://html5boilerplate.com) is this snippet using Internet Explorer-proprietary _conditional comments_:
```
<!--[if lte IE 9]>
<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com">upgrade your browser</a> to improve your experience.</p>
<hr/>
<![endif]-->
```
Support for conditional comments was removed in Internet Explorer 10, so that is a missed browser.
But based on the [browser usage statistics](https://caniuse.com/usage-table), showing a 0.07% usage, let us just take our chances and ignore that one for the time being...

#### v0.7.3: HTML5 Boilerplate [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/edc7c304881f5c7c1bb68e103d0541cd6ee81bda) | [deployment](https://build-vomhymkavq.now.sh) ]
[HTML5 Boilerplate](https://html5boilerplate.com) has a lot of [necessary tricks](https://github.com/h5bp/html5-boilerplate/blob/6.1.0/dist/doc/html.md) for our `index.html` file;
Things like:
* Character encoding
* [Viewport](https://en.wikipedia.org/wiki/Viewport)
* [CSS normalization](https://necolas.github.io/normalize.css/)
* The order of the meta elements

Let us include most of them.

Also [Google's HTML and CSS Style Guide](https://google.github.io/styleguide/htmlcssguide.html) is worth a look; Not obeying all those recommendation at the moment though, maybe later.

...

#### The Elm Architecture
The Elm Architecture is a pattern for designing webapps.
You can read all about it in [Elm's official documentation][elm-official-guide].
Said very shortly; it is single-directional data binding put into a model-view-controller ([MVC][mvc])-like design and code layout.
In fact, The Elm Architecture pioneered the single-directional data binding design.
Projects like [Redux][redux] have been inspired by it, so you may have already seen derivatives of this pattern.

The main entrance to Elm Architecture-based web applications is the [`Browser` package](https://package.elm-lang.org/packages/elm/browser/latest/).

#### v0.7.4: Elm: `Browser.sandbox`: Writing to the DOM [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/dc326f3a93bdfb893c1b9bb148a6bdc86ffe3670) ]
In the previous Elm code we just used Elm to produce an HTML text that was embedded in an existing HTML element (declared in our `index.template.html` file), like this:
```elm
main = Html.text "Default Webapp | Elm & ZEIT Now edition [v0.7.3]"
```
When using the `Browser.sandbox` function, the Elm Architecture becomes more visible.

```elm
main = Browser.sandbox
    { init = "Default Webapp | Elm & ZEIT Now edition [v0.7.4]"
    , view = \model -> Html.text model
    , update = \msg -> \model -> "N/A"
    }
```
(Like in [Haskell](https://www.haskell.org), the `\` mimics
<img src="https://latex.codecogs.com/gif.latex?\lambda"/> ("lambda"), so e.g. `\x` will correspond to [lambda calculus](lambda-calculus) notation of ![&lambda;x](https://latex.codecogs.com/gif.latex?\lambda&space;x "&lambda;x")&mdash;a bound variable in an anonymous function.)

The `main` value is a value/data structure representing our entire application that is handed to the Elm runtime.
The `init` value represents the initial application state&mdash;the initial/default model.
The `view` function produces the resulting view.
It is always invoked when the model changes.
The `update` function represents state changes, e.g. browser events received from the DOM.

As the user yet do not have any means of updating the application state via the DOM, the `update` function will never be invoked.
`init` is the only "update", for now.
Without messages/events coming from the browser our Elm application looks like this:
![](docs/browser-static.png)<div style="text-align: right"><sub><sup>Modification of source from: <a href="https://guide.elm-lang.org/effects/">https://guide.elm-lang.org/effects/</a></sup></sub></div>
...a "static" web page containing initial state only.

#### v0.7.5: Elm: Function declarations [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/b5b14c052db71edc8589953adb5ea8bdb1afe6f4) ]
Let us get rid of those anonymous(, refactoring-unfriendly, and test-unfriendly) functions&mdash;extracting them to their own declarations.
`view = \model -> Html.text model` now becomes `view model = Html.text model`

_Type signatures_ are also added.
Elm has automatic _type inference_, but it is recommended to include type signatures for readability/maintainability.
E.g. the `view` function has this type signature
```elm
view : Model -> Html msg
```
This reads; `view` is a function that takes a parameter of type `Model`, and returns a value of type [`Html`](https://package.elm-lang.org/packages/elm/html/latest/Html#Html).
The `msg` ("message") is a type variable telling the [`Html`](https://package.elm-lang.org/packages/elm/html/latest/Html#Html) value what kind of values that may be sent back into the Elm runtime.

In Elm and Haskell (and most other statically typed functional languages) type variables always start with a lowercase character, while concrete types always start with an uppercase character.

(`Html` is a "structure" type, like a container.
Another name for those "structure"/"container'ish" data types in computer programming is _functor_, and other examples of functors are _lists_ and the [`Maybe`](https://package.elm-lang.org/packages/elm/core/latest/Maybe) [type](https://en.wikipedia.org/wiki/Option_type).
With functors one can _map_ over to produce the same structure with transformed values/state inside.
Functors protect and may add behaviour to its internal state the same way `classes` do in OOP.
More on that later.)

In our very simple application we have no browser/user events declared, so we just add the concrete special type `Never`, meaning that no events will be accepted from the DOM by the Elm runtime.
If we try to declare some browser event handling in our application it will not compile!
```elm
view : Model -> Html Never
view model = Html.text model
```
Our model is very simple&mdash;just a string:
```elm
type alias Model = String

initialModel : Model
initialModel = "Default Webapp | Elm & ZEIT Now edition [v0.7.5]"
```

#### v0.7.6: Elm: Modules [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/474ce0ce9e21a236d2c1b5a7551b79c7421579e5) ]
Splitting up code into modules (most often) increases testability, readability, and maintainability, e.g. making code reuse easier.

Elm has built-in support for modules.
We extract `model` and `view` from `Main.elm` into typically `Model.elm` and `View.elm`.
All Elm files start with the keyword `module` followed by the name of the module.
The keyword `exposing` tells which functions are to be exposed outside the module (file).
```elm
module Model exposing (Model, initialModel)
```
Here `Model` is both the name of the module and an exposed value (the type alias).

`Main.elm` now have to import them to be able use them.
That is accomplished via the keyword `import`.
```elm
import Model exposing (Model)
import View
```
When adding `exposing` when importing we can reference those exposed functions directly, without having to state the full module path.
E.g. here we can use `Model` instead of `Model.Model`.

#### v0.7.7: Elm: View [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/b0b13f832a57af25d353cb2f9348358f442d8647) | [deployment](https://build-tvxzdyyxeh.now.sh) ]
Growing the webapp means expanding our model&mdash;we need more than just one string value.
Elm's core structure type [_record_](https://guide.elm-lang.org/core_language.html#records) is suitable for this.
A record (value) is a fixed set of key-value pairs, similar to objects in JavaScript or Python.
Let us add a few more attributes:
```elm
type alias Model =
    { title : String
    , edition : String
    , version : String
    , content : String
    }
```

##### Elm: HTML "template" functions
Generating the HTML is a bit different then we are used from JavaScript-based tools and frameworks.
There is no template language here, rather a regular statically typed Elm data structure.
When building HTML in Elm, we use helper functions mimicking the regular HTML tags and attributes.
These helper functions are mostly ready-made and available in the [`Html`](https://package.elm-lang.org/packages/elm/html/latest/) package.
In fact, they are all partially applied versions of this common DOM node function:
```elm
node : String -> List (Attribute msg) -> List (Html msg) -> Html msg
```
This means that this `node` function defines how all HTML tags are represented in Elm.
A node/tag name, a list of attributes, and a list of child nodes.
E.g. the `div` function is defined like this:
```elm
div : List (Attribute msg) -> List (Html msg) -> Html msg
div attributes children = node "div" attributes children
```
Do notice that the node, all attributes, all child nodes, and their attributes as well, may emit the same `msg` type.
This means that this type (which we will have to define once we let messages/events into our application from either the browser/user or from outside) must include all events in this domain/application.
This is possible as the `msg` will be a [sum type](sum-type).

To obtain these HTML tag helper functions we just extend our import declaration for the view:
```elm
import Html exposing (Html, article, div, footer, header, hr, section, span, text)
```

Our page skeleton is now expanded to a three-sectioned article/page:
```elm
view : Model -> Html Never
view model =
    article []
        [ headerSection model
        , mainSection model
        , footerSection model
        ]
```

The sections are also plain functions, e.g. the header section:
```elm
headerSection : Model -> Html Never
headerSection model =
    header []
        [ div []
            [ span [] [ text (model.title ++ " | " ++ model.edition) ]
            ]
        , hr [] []
        ]
```
When our `view` function is handed over to the Elm runtime, it updates its virtual DOM and figures out what effectful writes should be made to the real DOM&mdash;all executed [safely and extremely efficiently](https://elm-lang.org/blog/blazing-fast-html-round-two)!

(In my opinion, application code should never touch the DOM directly.
Sooner or later that will just end up with [null references](https://en.wikipedia.org/wiki/Null_pointer), [memory leakage](https://en.wikipedia.org/wiki/Memory_leak), [screen flickering](https://en.wikipedia.org/wiki/Flash_of_unstyled_content), and other bugs...)

The header section ends up in the browser as expected:
```html
<header>
    <div>
        <span>Default Webapp</span><span> | Elm &amp; ZEIT Now edition</span>
    </div>
    <hr>
</header>
```

#### v0.7.8: Page styling [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/2dca9550514bc84d22baf82dbec54bed6558aeb4) | [deployment](https://build-sfohtqquor.now.sh) ]
To be able to include style class attributes in our view, include this module:
```elm
import Html.Attributes exposing (class, style)
```
Now we can extend e.g. our header:
```elm
headerSection model =
    header []
        [ div []
            [ span [ class "title" ] [ text model.title ]
            , span [ class "edition" ] [ text (" | " ++ model.edition) ]
            ]
        , hr [] []
        ]
```
...

We are using CSS Flexbox for laying out our page.
Our page is a simple column with items/sections, which is quite easy to do with flexboxes.
An excellent tutorial can be found [here][flexbox-tutorial].
Also, there is a [game][flexbox-game] :-)

An alternative to CSS Flexbox is [CSS Grid Layout][css-grid-layout].

#### v0.7.9: Elm: `Browser.sandbox`: Reacting to DOM events [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/77b2cde9aa62144a3746973e7d9e5505fae2cd73) | [deployment](https://build-qwhozdzxrb.now.sh) ]
We are now going to accept and react to some events coming from the user, via the mouse/keyboard, via the browser, via the DOM, and finally via our `view` function within the Elm runtime.
The system now looks like this:
![][elm-architecture-sandbox]
<div style="text-align: right"><sub><sup>Source: <a href="https://guide.elm-lang.org/effects/">https://guide.elm-lang.org/effects/</a></sup></sub></div>

The `Msg` type is the concrete version of the parametric `msg` type mentioned above.
Our view's type signature must be updated from:
```elm
view : Model -> Html Never
```
to:
```elm
view : Model -> Html Msg
```
as our resulting `Html` value now may eventually emit events back to our `Browser.sandbox`-based `main` function.

This `Msg` type we declare in `Model.elm`:
```elm
type Msg = Background String
```

...

There are two ways of declaring types in Elm:
1. We declare [product types][product-type] using the keyword `type alias`
1. We declare [sum types][sum-type] using the keyword `type`

For product types the name type _alias_ is used because built-in Elm types are used when declaring them, like `String`s, tuples, and records.

...

This `Msg` type is a sum type.
The `Background String` is a _type constructor_&mdash;the only one so far.
There will be many of them though, declaring the different mutually exclusive "shapes" this `Msg` type may take.
`Background String` means that it is a "set-the-background" message taking  string parameter, which is the name of the colour.

(We could also declared another sum type called e.g. `Color`, defining our colour to choose amongst.
Then our background message data constructor would have been `Background Color`.
That we'll maybe do later on.)

Ok, with the new background colour string, we must update our model to hold this new piece of state, the current background colour&mdash;in `Model.elm`:
```elm
type alias Model =
    { title : String
    ...
    , backgroundColor : String
    ...
    }
```
There, we also should declare our wanted background colour options, e.g.:
```elm
{-| CSS-compatible background colour.
A list of the colours can be viewed e.g. here:
<https://developer.mozilla.org/en-US/docs/Web/CSS/color_value>
-}
backgroundColors : List String
backgroundColors =
    [ "white"
    , "khaki"
    , "coral"
    , "skyBlue"
    , "lightSlateGrey"
    ]
```

Meanwhile, in our view, `View.elm`, we must transform these colours to some Elm HTML element functions&mdash;representing HTML input components that the user can use to change the background colour.
In functional programming, transforming values from one type to another means we must _map_ over those values:
```elm
List.map : (a -> b) -> List a -> List b
```
where `a` is our initial type, `String`&mdash;but what is `b`, our target type?

All HTML element functions in Elm have this type signature:
```elm
List (Attribute msg) -> List (Html msg) -> Html msg
```
It takes a list of attributes, a list of child HTML elements, and returns an HTML element.
Both the list of attributes, the list of child HTML elements, and the resulting HTML element may produce messages of type `msg`.
In our case `msg` is of type `Msg`.
This means that the `b` type we are looking for is `Html Msg`:
```elm
List.map : (String -> Html Msg) -> List String -> List (Html Msg)
```
So, to map the list of background colours to a list of e.g. background colour buttons, we must implement a function of type `String -> Html Msg`, e.g.:
```elm
backgroundColorButton : String -> Html Msg
```
...that we can use when building our view:
```elm
mainSection : Model -> Html Msg
mainSection model =
    section []
        [ ...
        , div [ class "background-color-picker" ] (List.map backgroundColorButton Model.backgroundColors)
        ]
```
The implementation of the `backgroundColorButton` may look like this:
```elm
backgroundColorButton : String -> Html Msg
backgroundColorButton backgroundColor =
    div
        [ class "background-color-button"
        , style "background" backgroundColor
        , onClick (Background backgroundColor)
        ]
        []
```
...giving it a style class, setting the background of the button to the actual current background colour, and attaching a DOM event to it.
Typical events from the DOM are on-focus, on-click, and on-input.
Here we are using the `onClick` function in the `Html.Events` module:
```elm
import Html.Events exposing (onClick)
```
To summarize&mdash;when the element is clicked it fires the event which is given to the Elm runtime.
There the data constructor `Background backgroundColor` is invoked with the selected colour, and associated with the event.
Then it is handed over to the `update` function, which will update our model, which will invoke our `view` function, and repaint the browser screen.
Here is a good illustration of the Elm Architecture data flow:

![](docs/elm-architecture-illustration.jpg)<div style="text-align: right"><sub><sup>Illustration of The Elm Architecture (found on Twitter)</sup></sub></div>

#### v0.7.10: Elm: `Browser.element` &ndash; Flags [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/a427c8b12e68c7e4b57e88810b70b88780abbac3) | [deployment](https://build-vxobadadil.now.sh) ]
From here and onwards, we will switch from the simple and limited `Browser.sandbox` function, to the more real-world `Browser.element` function.
This will introduce the ideas of _commands_ and _subscriptions_ which will allow us to interact with the world beyond the browser's DOM.
By using the `Browser.element` function, our system will look like this:
![][elm-architecture-element]
<div style="text-align: right"><sub><sup>Source: <a href="https://guide.elm-lang.org/effects/">https://guide.elm-lang.org/effects/</a></sup></sub></div>

With _commands_ (`Cmd`) you can "command" the Elm runtime to do stuff, like [HTTP][http].
With _subscriptions_ (`Sub`) you can "subscribe" to event sources, like clock ticks.
`Cmd` and `Sub` are predefined types in Elm.
More on those types and concepts later on.

Using `Browser.element` also unlocks two other mechanisms Elm provides for interacting with the JavaScript runtime&mdash;_flags_ and _ports_.
"Flags" give us the ability to hand over values at start-up, while "ports" gives us a type-safe data channel to the JavaScript runtime.
We will use flags first, and ports next.

##### Elm: Flags
At the moment we are hard-coding the application version in our `Model.elm`, duplicating the value in our `package.json`.
Duplication and magic values are no good, so let us get the application version directly from the source.
Webpack lets us include build properties easily via its [DefinePlugin][define-plugin]&mdash;in `webpack.config.js`:
```javascript
let definePluginConfig = {
    VERSION: JSON.stringify(require('./package.json').version),
    TIMESTAMP: JSON.stringify(new Date().toISOString()),
    MODE: JSON.stringify('Development')
};
```
and:
```javascript
config.plugins = [
    new webpack.DefinePlugin(definePluginConfig),
    ...
]
```
The DefinePlugin will attach variables `VERSION`, `TIMESTAMP`, and `MODE` to JavaScript's global `window` object.
Give these values to the Elm runtime at start-up in `index.js`:
```javascript
const app = require('./elm/Main.elm');
app.Elm.Main.init({
    node: document.getElementById('elmContainer'),
    flags: {
        "version": VERSION,
        "timestamp": TIMESTAMP,
        "mode": MODE
    }
});
```
These values are from the outside world, the JavaScript runtime&mdash;a source that we certainly do not trust (beware of mutated state and nulls)!
What Elm provides is bullet-proof type safety, saving us from the annoying and sometimes dangerous runtime exceptions.
The flags are [verified by the Elm runtime](https://guide.elm-lang.org/interop/flags.html) before they are handed to our application.
We wrap them as [`Maybe`](https://package.elm-lang.org/packages/elm/core/latest/Maybe) values, a [well-known](https://en.wikipedia.org/wiki/Option_type) sum type:
```elm
type alias Flags =
    { version : Maybe String
    , timestamp : Maybe String
    , mode : Maybe String
    }
```
Now we can take advantage of the new `init` type signature provided by the `Browser.element` function&mdash;which goes from:
```elm
init : Model
```
to:
```elm
init : Flags -> ( Model, Cmd Msg )
```
The `init` function takes a `Flags` [record](https://guide.elm-lang.org/core_language.html#records) value, and returns a [tuple](https://guide.elm-lang.org/core_language.html#tuples) value consisting of a `Model`, and a `Cmd` that may eventually produce a `Msg` that gets fed into the `update` function&mdash;which also may produce `( Model, Cmd Msg )` tuples:
```elm
update : Msg -> Model -> ( Model, Cmd Msg )
```
This way, one can declare a chain of effects, both at start-up and during application execution.

...

In our case, `init` returns our initial/default model, `Model.default`.
The pipe (`|`) operator means that a _new_ [record value](https://guide.elm-lang.org/core_language.html#records) will be created based on `Model.default`.
The expressions on the right side of the pipe is the new values that will "enrich"/"decorate" the original record.
Our `init` function does not produce any `Msg` values (wrapped in `Cmd`), so we only declare `Cmd.none`&mdash;a special value for that (rather ordinary) scenario.
Our implementation utilizes the `Maybe.withDefault` function to provide a default value if the given argument for some reason is missing:
```elm
init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { default
        | version = Maybe.withDefault "?" flags.version
        , buildTimestamp = Maybe.withDefault "?" flags.timestamp
        , buildMode = Maybe.withDefault "" flags.mode
      }
    , Cmd.none
    )
```

#### v0.7.11: Elm: Testing [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/9866a9a2dfa7ec631ebea4dd3630579c8c2cdcac) | [deployment](https://build-mbrvmkmtgr.now.sh) ]
A practical way of specifying/testing functions and logic is paramount when developing software applications.
In Elm, we have several modules taking care of this.
One of them is [elm-test](https://package.elm-lang.org/packages/elm-explorations/test/latest/) for writing unit tests and [fuzz tests](https://en.wikipedia.org/wiki/Fuzzing).

Install elm-test:
```bash
npm install elm-test --save-dev
./node_modules/.bin/elm-test init
```
This will create a `tests` directory with some files in it.

Update the npm script tasks in `package.json`:
```json
"elm:format-main": "elm-format src/elm/ --yes",
"elm:format-test": "elm-format tests/ --yes",
"elm:format": "npm-run-all --parallel elm:format-main elm:format-test",
"elm:test": "elm-test",
```
Run elm-test to see if all is in place:
```bash
npm run elm:test
```
Then delete `tests/Example.elm` and specify your own.

...

We have introduced `DateFormatterSpec.elm`&mdash;a specification for a couple of functions we need for displaying the build timestamp in a bit more readable format.
This test file uses a lot of Elm's nifty functional constructs, but let it stand as a specifications/tests example, and focus on the implementation&mdash;`DateFormatter.elm`.
It introduces some more functional goodies as well.

We will format the build timestamp, which we now have changed from a string version to a [POSIX time](https://en.wikipedia.org/wiki/Unix_time) number value obtained from `new Date().getTime()`.
This means we can update our `timestamp` type declaration in `Flags`:
```elm
type alias Flags =
    { ...
    , timestamp : Maybe Int
    , ...
    }
```
Now we can use Elm's built-in `Time.millisToPosix` function to convert the POSIX time value to a [`Posix`](https://package.elm-lang.org/packages/elm/time/latest/Time#Posix) value, and build the time format we want.

##### Elm: Function composition
In `DateFormatter.elm` we have a an example of _function composition_&mdash;a central concept in functional programming.
Given two functions:
<p>
<center>
<img src="https://latex.codecogs.com/gif.latex?\begin{aligned}f&:X\to&space;Y\\g&:Y\to&space;Z\end{aligned}"/>
</center>
</p>

Their composition is:
<p>
<center>
<img src="https://latex.codecogs.com/gif.latex?g\circ&space;f:X\to&space;Z"/>
</center>
</p>

Applying the composed function to all <img src="https://latex.codecogs.com/gif.latex?x"/> in <img src="https://latex.codecogs.com/gif.latex?X"/> is defined by:
<p>
<center>
<img src="https://latex.codecogs.com/gif.latex?(g\circ&space;f)(x)=g(f(x))"/>
</center>
</p>

We want to display all date and time numbers with two digits, prepended by a '`0`' when it is a single-digit natural number.
In Elm's `String` module we have:
```elm
fromInt : Int -> String
```
and
```elm
padLeft : Int -> Char -> String -> String
```
Our target function is something like:
```elm
int2twoDigitsString : Int -> String
```
To accomplish that we first have to _partially apply_ `padLeft` to our fixed arguments, creating a new function:
```elm
twoDigitsString : String -> String
twoDigitsString = String.padLeft 2 '0'
```
Now we have two functions lined up for composition:
<p>
<center>
<img src="https://latex.codecogs.com/gif.latex?twoDigitsString\circ&space;fromInt:Int\to&space;String"/>
</center>
</p>

Applying the composed function to all <img src="https://latex.codecogs.com/gif.latex?x"/> of type `Int` is defined by:
<p>
<center>
<img src="https://latex.codecogs.com/gif.latex?(twoDigitsString\circ&space;fromInt)(x)=twoDigitsString(fromInt(x))"/>
</center>
</p>

In Elm, we compose functions by using either `<<` or `>>`.
`>>` means "execution order" ("read from left"):
```elm
int2twoDigitsString : Int -> String
int2twoDigitsString = String.fromInt >> twoDigitsString
```
while `<<` means "composition order" ("read from right"), also known as "piping":
```elm
int2twoDigitsString : Int -> String
int2twoDigitsString = twoDigitsString << String.fromInt
```
Or with the `twoDigitsString` "inlined" and omitted:
```elm
int2twoDigitString : Int -> String
int2twoDigitString = String.padLeft 2 '0' << String.fromInt
```

##### Elm: Pattern matching
`DateFormatter.elm` contains another central concept in functional programming, _pattern matching_.
In Elm we pattern match with the `case of` keyword.
In object-oriented programming, case expressions are often discouraged in favour of [subtype polymorphism](https://en.wikipedia.org/wiki/Subtyping).
In functional programming on the other hand, it is an important construct when working with [sum types](sum-type).

Our `format` function looks like this:
```elm
format : Maybe Int -> String
format maybeTimestamp =
    case maybeTimestamp of
        Just timestampInMilliseconds ->
            let
                posix =
                    Time.millisToPosix timestampInMilliseconds

                year =
                    Time.toYear Time.utc posix |> int2twoDigitString

                month =
                    Time.toMonth Time.utc posix |> Date.monthToNumber |> int2twoDigitString

                day = ...
                hour = ...
                minute = ...
            in
            year ++ "-" ++ month ++ "-" ++ day ++ " " ++ hour ++ ":" ++ minute ++ " (UTC)"

        Nothing ->
            "?"
```
We pattern-match our build timestamp `Maybe` value to see if it is there.

Examples of the `format` function are:
```elm
format Nothing == "?"
format Just 0 == "1970-01-01 00:00 (UTC)"
format Just 1000000000000 == "2001-09-09 01:46 (UTC)"
```

##### Elm: Function application
In the `format` function our `int2twoDigitString` explained above is in use.
The function application:
```elm
Time.toYear Time.utc posix |> int2twoDigitString
```
is just a more reading-friendly version of:
```elm
int2twoDigitString (Time.toYear Time.utc posix)
```
...keeping the read order left-to-right corresponding to the order of the function applications.

We have to install two more Elm packages to make these new functions compile:
```bash
elm install elm/time
elm install justinmimbs/date
```

#### v0.7.12: Elm: `Browser.element` - Ports
_TODO: ..._

#### v0.7.13: Elm: Animations
_TODO: ..._

### v0.8: Elm: "Offline first" / Service Workers
_TODO: ..._

### v0.x: Elm: "Mobile App" / Progressive Web Applications (PWA)
_TODO: ..._

### v0.x: Elm: "Desktop App" / [Electron][electronjs]
_TODO: ..._

### v0.x: Elm: Utilizing [FaaS](https://en.wikipedia.org/wiki/Function_as_a_service) resources
_TODO: ..._

### v0.x: Elm: Type-safe styling
_TODO: ..._

### v0.x: Elm: Standalone components
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
- v0.7.11: <https://build-mbrvmkmtgr.now.sh>
- v0.7.10: <https://build-vxobadadil.now.sh>
- v0.7.9: <https://build-qwhozdzxrb.now.sh>
- v0.7.8: <https://build-sfohtqquor.now.sh>
- v0.7.7: <https://build-tvxzdyyxeh.now.sh>
- v0.7.3: <https://build-vomhymkavq.now.sh>
- v0.7.2: <https://build-evhjfounxv.now.sh>
- v0.7.1: <https://build-jexriqbedd.now.sh>
- v0.7.0: <https://build-cbqmulqgus.now.sh>

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

[lambda-calculus]: https://en.wikipedia.org/wiki/Lambda_calculus
[ml-family]: https://en.wikipedia.org/wiki/ML_(programming_language)
[immutability]: https://en.wikipedia.org/wiki/Immutable_object
[sum-type]: https://en.wikipedia.org/wiki/Tagged_union
[product-type]: https://en.wikipedia.org/wiki/Product_type
[partial-application]: https://en.wikipedia.org/wiki/Partial_application
[currying]: https://en.wikipedia.org/wiki/Currying
[parametric-polymorphism]: https://en.wikipedia.org/wiki/Parametric_polymorphism

[elm]: http://elm-lang.org
[elm-official-guide]: https://guide.elm-lang.org/
[elm-webpack-loader]: https://github.com/elm-community/elm-webpack-loader
[elm-html-html]: https://package.elm-lang.org/packages/elm/html/latest/Html
[elm-css]: https://package.elm-lang.org/packages/rtfeldman/elm-css/latest
[elm-format]: https://github.com/avh4/elm-format
[elm-analyse]: https://stil4m.github.io/elm-analyse/
[elm-architecture-sandbox]: https://guide.elm-lang.org/effects/diagrams/sandbox.svg
[elm-architecture-element]:
https://guide.elm-lang.org/effects/diagrams/element.svg

[semver]:https://semver.org
[regex]: https://en.wikipedia.org/wiki/Regular_expression
[mvc]: https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller

[http]: https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol
[https]: https://en.wikipedia.org/wiki/HTTPS
[html]: https://en.wikipedia.org/wiki/HTML
[dom]: https://en.wikipedia.org/wiki/Document_Object_Model
[html]: https://en.wikipedia.org/wiki/HTML
[css]: https://en.wikipedia.org/wiki/Cascading_Style_Sheets
[sass]: https://sass-lang.com
[less]: http://lesscss.org
[css-modules]: https://github.com/css-modules/css-modules
[css-blocks]: https://css-blocks.com
[bem]: http://getbem.com
[smacss]: https://smacss.com
[flexbox-tutorial]: https://css-tricks.com/snippets/css/a-guide-to-flexbox/
[flexbox-game]: https://flexboxfroggy.com
[css-grid-layout]: https://css-tricks.com/snippets/css/complete-guide-grid/
[sass-webpack-loader]: https://github.com/webpack-contrib/sass-loader
[css-webpack-loader]: https://github.com/webpack-contrib/css-loader
[style-webpack-loader]: https://github.com/webpack-contrib/style-loader
[sass-lint]: https://github.com/sasstools/sass-lint
[twitter-bootstrap]: http://getbootstrap.com
[google-material-design]: https://material.io
[wysiwyg]: https://en.wikipedia.org/wiki/WYSIWYG
[favicon]: https://medium.com/tech-angels-publications/bundle-your-favicons-with-webpack-b69d834b2f53
[webpack-favicon]: https://stackoverflow.com/questions/37298215/add-favicon-with-react-and-webpack

[grunt]: https://gruntjs.com
[gulp]: https://gulpjs.com
[parcel]: https://parceljs.org
[webpack]: https://webpack.js.org
[webpack-concepts]: https://webpack.js.org/concepts/
[html-webpack-plugin]: https://github.com/jantimon/html-webpack-plugin
[define-plugin]: https://webpack.js.org/plugins/define-plugin/

[node]: https://nodejs.org
[npm]: https://www.npmjs.com
[package-json]: https://docs.npmjs.com/files/package.json
[yarn]: https://yarnpkg.com
[react]: https://reactjs.org
[redux]: https://redux.js.org
