# Default Webapp (Elm & ZEIT Now edition)

My default (opinionated/favourite) setup for web application development. (I guess that statement will remain true at least a year or so after the date of the last commit...)

The main objectives of this code base are:

- A design that _scales both technically and organizationally_
- Opinionated&mdash;yes, but also _idiomatic_

Regarding _technical scaling_&mdash;this setup is a simple and basic webapp with trivial content.
Yet it will be a complete vertical of a sound architecture with tooling&mdash;ready for a significant expansion without having to rewrite/reorganize the code base, nor having to introduce more components just to make things work better.
It should be out-of-the-box-ready for hundreds of concurrent users as well.

Regarding _organizational scaling_&mdash;it is just another word for _readability_ and _maintainability_.
An important part of achieving this is a concise and compact code base&mdash;which leads us to the most opinionated technical component in this setup&mdash;[Elm][elm].
Elm is a statically typed functional programming language&mdash;a [family][ml-family] of programming languages that has quite intriguing properties.
If you haven't tried one of them, you really should!
(No links here, you'll figure it out.)

...

Other design decisions/components being embraced&mdash;or at least evaluated&mdash;in this project are/will be:

- Short feedback loops (Micro-iterations)
- [Responsive design][responsive] (of course)
- [Progressive Web Apps][pwa]
- A ["serverless"][serverless-computing] approach
- A ["Continous integration/continuous deployment" (CI/CD) ][ci-cd] setup

These will be argued for, and introduced on the way as we go along, commit by commit, statement by statement&mdash;**stay tuned!**

(This will (maybe) end up like a "web project starter", a well-documented starting-point for a project, like a boilerplate&mdash;or just a basic tutorial.
I will take a somewhat "naive approach" when growing this codebase.)

A live version is hosted on [ZEIT Now][now], as <https://defaultwebapp.now.sh>.

...

This repository/project is sort of an update of my previous ["default webapp"][default-webapp-heroku] project, developed in 2014-2015.
(I guess it is kind of a [code kata][kata].)
The most important change is that the "embedded" Node.js-based server API is gone.
I will try to use services maintained and hosted elsewhere only.
Many of the components from the client-side project are now replaced by other preferred components&mdash;e.g. like JavaScript/[React][react]/[Redux][redux] being replaced by [Elm][elm], [Grunt][grunt] being replaced by [webpack][webpack], [Heroku][heroku] being replaced by [ZEIT][zeit]'s [Now][now].
Also, some components are kept the same, like [Sass][sass], and probably the look & feel. (I am not a UX guy.)



* * *



Ok, the very first thing to do, is getting our webapp online;
Deploying the most basic version imaginable of our webapp to our hosting service of choice.

## Prerequisites

Just to be very basic and specific, the only prerequisites are:
- Some knowledge of English
- A computer, a steady supply of electric power and network connectivity
- An email account and an email client - signed in

;-)

Then:
1. Install [Node.js][node] (The package manager tool, _npm_, is included).

   While at it&mdash;update npm (which release cycle is more frequent than Node.js'):
   
       npm install npm@latest --global

1. Create a project folder, and at that location, open a command line terminal.

### ZEIT Now: Deployment to staging

Deploy/Publish your webapp using [ZEIT Now][now].
Let's get our first version online in an instance:

    now

That fails&mdash;unknown command&mdash;install the ZEIT Now client:

    npm install now@latest --global

Try again:

    now

That fails&mdash;nothing to deploy&mdash;add a file to deploy (e.g. in a Windows `CMD` terminal):

    TYPE NUL > index.txt

Try again:

    now

If you don't have an account yet;
_Type in your email address_&mdash;_go to your email client_&mdash;_verify your email address_.
You now have a ZEIT Now account - also, you are now signed in.

Try again:

    now

Give the deployment confirmation a '`y`' - and that's it!
**Your webapp is online** - the very, very first version of it that is...

Paste the given URL into a browser tab and have a look.
The deployed webapp is not particularly interesting&mdash;it is completely empty.
Ok, let us create our very first version with some actual content (again e.g. in a Windows `CMD` terminal):

    ECHO Default Webapp - Elm and ZEIT Now edition (v0.1.1) > index.txt

Deploy (again):

    now

### ZEIT Now: Deployment to production

ZEIT Now has auto-generated a URL for the commissioned resource.
It is to be regarded as a staging area for your deployment.
_To fully put the webapp into production, "alias" the staged area to your preferred URL_, like this:

    now alias ${project folder name}-${auto-generated staging-id}.now.sh ${my-webapp-id}

E.g.:

    now alias default-webapp-elm-now-olkrehlqms.now.sh defaultwebapp

### ZEIT Now: More convenient deployment to production

Creating all those staging-to-production aliasing commands can be cumbersome.
ZEIT Now has a configuration file&mdash;`now.json`&mdash;that helps out with that.
`now.json` has a property `alias` which will be assigned to the latest deployment when running `now alias` (with no arguments).
So, e.g., for automating deployment to my default webapp `defaultwebapp`:

    ECHO {"alias":"defaultwebapp"} > now.json

Update "content":

    ECHO Default Webapp - Elm and ZEIT Now edition (v0.1.2) > index.txt

Now, to deploy to staging, _and_ at the same time, create a production alias of the deployment, just:

    now --public & now alias

Check out this easy-to-remember URL in all browsers available.



* * *



## Changelog

### v0.1: Establish project and deploy to ZEIT Now

#### v0.1.0: Empty static single resource [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/56863c2f0285c45f903f5028db06b076c0bbe298) | [deployment](https://file-pmqnhwkidm.now.sh) ]
(See above.)

#### v0.1.1: Static single plain text resource [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/1cedc30a49a1738c6f5f64938537b6cdc3757de6) | [deployment](https://file-iomajqiucy.now.sh) ]
(See above.)

#### v0.1.2: Single static web resource [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/62c30d234434e46637d7db8cc074de6602ee2d09) | [deployment](https://file-xkfehobloq.now.sh) ]
`text/plain` resource replaced by `text/html` resource&mdash;gives us quite a bit more possibilities.

#### v0.1.3: Text formatting [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/9eb77c484ea273caeec36a3c187bb824f28762bc) | [deployment](https://file-eswpsfmlgn.now.sh) ]
Very basic HTML tags added.
(HTML tutorials and WYSIWYG editor helpers are all over the web.)

#### v0.1.4: Convenient deployment to production [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/3d6cdd9c4944878ea9ce5e2c6ed36e79ffea95f4) ]
(See above.)

### v0.2: Project layout & Building with npm and webpack

#### v0.2.0: Project layout  [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/03ca6f91da131e70cdffaa3632a22a3e8ed754c4) | [deployment](https://build-epqechqdql.now.sh) ]
This commit includes:
- A designated source folder, `src`, should include most source files.
Left out at the project root are documentation, license, and project-wide configurations.

- A designated build folder, `build`, brings the need of a `.gitignore` file, ignoring that folder from version control.
Also, it mandates a change in the ZEIT Now configuration file `now.json`&mdash;where the deployment prefix (`name`) goes from default (project folder name) to `"name":"build"`. Read about the `now.json` configuration file [here][now-json].

- The only "build" step so far is just to copy the `src/index.html` file to the `build` folder&mdash;_manually for now_. (We have to do something about that.)

#### v0.2.1: npm [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/39b770bd209c35f7504461d61c155ab448c4727b) ]
[_npm_][npm] originally was the "Node.js Package Manager", but is now become the de-facto tool for all web and JavaScript-based projects.
All project meta-information and package/component dependencies goes in its `package.json` project configuration file.

We start with a vanilla `package.json`, which we will extend in the following commits.

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
   - `test` identifies which file or files should be transformed
   - `use` indicates which loader should be used to do the transforming

1. _Plugins_&mdash;While loaders are used to transform certain types of modules, plugins can be leveraged to perform a wider range of tasks like bundle optimization, asset management and injection of environment variables.

Alternatives to webpack are [Grunt][grunt], [Gulp][gulp], and [Parcel][parcel].
I must admit I am not a huge webpack fan&mdash;I find the API semantics a bit confusing and overly complicated.
Anyway, webpack is clearly the idiomatic build tool choice at the moment.

###### Our first config

As our first _entry_, we direct webpack to... our only source file:
```
entry: path.join(__dirname, 'src/index.html'),
```

As our first _output_, we direct webpack to our build folder:
```
output: {
    path: path.join(__dirname, 'build'),
    filename: 'index.js',
}
```
In this first `webpack.config.js` we are using webpack for what it is not intended for&mdash;simple file copying.
That is why we are using a _plugin_, `ignore-emit-webpack-plugin`, to simply ignore and suppress the emitting of the webpack bundle `ìndex.js`, and just using the _loader_ `file-loader` to copy the `index.html` to our `build` folder.

We will be using webpack in a more idiomatic manner in the subsequent commits.

###### As a build script

Add our first npm script/task/command in `package.json`:
```
"scripts": { 
    "build": "webpack" 
}, 
```

Install and add webpack as a development dependency in `project.json`:
```
npm install webpack --save-dev 
npm install webpack-cli --save-dev 
``` 
And run our new scripted task:
```
npm run build
```

#### v0.2.4: Semantic project tasks [ [commit](https://github.com/eirikt/default-webapp-elm-now/commit/93a7c1bb1b81b2b3ffb05a9c529d1c91678bdd0f) | [deployment](https://build-vwmktnocgx.now.sh) ]
In our `package.json` scripts for project tasks/phases are added&mdash;chronologically:
1. _setup_
1. _clean_
1. _build_
1. _deploy to staging_
1. _deploy to production_

At all times we can list all npm scripts/tasks/commands with:
```
npm run
``` 

So from now on we can deploy to staging with a single command:
```
npm run deploy
``` 

### v0.3: Elm (version 0.19&mdash;latest, greatest)
_TODO: ..._

### v0.x: Styling with Sass
_TODO: ..._

### v0.x: Live reloading & Hot reloading
_TODO: ..._

### v0.x: Static code analysis
_TODO: ..._

### v0.x: HTML5 Boilerplate
_TODO: ..._

### v0.x: The Elm Architecture
_TODO: ..._

### v0.x: Elm: Communicating with the outside world
_TODO: ..._

### v0.x: Elm: "Offline first", using Service Workers
_TODO: ..._

### v0.x: Elm: "Mobile App" / Progressive Web Applications
_TODO: ..._

### v0.x: Elm: Utilizing [FaaS](https://en.wikipedia.org/wiki/Function_as_a_service) resources
_TODO: ..._

### v0.x: Elm: "Desktop App" / Electron
_TODO: ..._

### v0.x: ...
_TODO: ..._



* * *



## Webapp deployment history

Latest greatest, always: <https://defaultwebapp.now.sh>

A list of deployments with visual differences:
- v0.2.4: <https://build-vwmktnocgx.now.sh>
- v0.2.3: <https://build-jzwvseuphj.now.sh>
- v0.2.0: <https://build-epqechqdql.now.sh>

- v0.1.3: <https://file-eswpsfmlgn.now.sh>
- v0.1.2: <https://file-xkfehobloq.now.sh>
- v0.1.1: <https://file-iomajqiucy.now.sh>
- v0.1.0: <https://file-pmqnhwkidm.now.sh>




[serveless-framework]:https://en.wikipedia.org/wiki/Serverless_Framework
[serverless-computing]: https://en.wikipedia.org/wiki/Serverless_computing

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

[ml-family]: https://en.wikipedia.org/wiki/ML_(programming_language)
[elm]: http://elm-lang.org

[grunt]: https://gruntjs.com
[gulp]: https://gulpjs.com
[webpack]: https://webpack.js.org
[webpack-concepts]: https://webpack.js.org/concepts/
[parcel]: https://parceljs.org

[node]: https://nodejs.org
[npm]: https://www.npmjs.com
[package-json]: https://docs.npmjs.com/files/package.json
[yarn]: https://yarnpkg.com 
[react]: https://reactjs.org
[redux]: https://redux.js.org
[sass]: https://sass-lang.com

[default-webapp-heroku]: https://github.com/eirikt/default-webapp-heroku
[kata]: https://en.wikipedia.org/wiki/Kata_(programming)
[inventing-on-principle]: https://vimeo.com/36579366
