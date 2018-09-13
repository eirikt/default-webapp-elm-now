# Default Webapp (Elm & ZEIT Now edition)

My default (opinionated/favourite) setup for web application development. (That statement will remain true at least a year or two after the date of the latest commit.)
The main objectives being:

- A design that _scales both technically and organizationally_
- Opinionated&mdash;yes, but also _idiomatic_

Regarding _technical scaling_&mdash;this setup is a simple and basic webapp with trivial content.
Yet it will be a complete vertical of a sound architecture&mdash;ready for a significant content adding without having to rewrite/reorganize the code base, nor having to introduce more components just to make things work better.
It should be out-of-the-box-ready for thousands of concurrent users as well.

Regarding _organizational scaling_&mdash;it is just another word for _readability_ and _maintainability_.
An important part of achieving this is a concise and compact code base&mdash;which leads us to the most opinionated technical component in this setup&mdash;[Elm][elm].
Elm is a statically typed functional programming language&mdash;a [family][ml-family] of programming languages that has quite intriguing properties.
If you haven't tried one of them, you really should!
(No links here, you'll figure it out.)

...

Other design decisions/components being embraced&mdash;or at least evaluated&mdash;in this project are/will be:

- Micro-iterations/short feedback loops
- [Responsive design][responsive] (of course)
- [Progressive Web Apps][pwa]
- A ["serverless"][serverless-computing] approach
- A ["Continous integration/continuous deployment" (CI/CD) ][ci-cd] setup

These will be argued for, and introduced on the way as we go along, commit by commit, statement by statement&mdash;**stay tuned!**

(This will (maybe) end up like a "web project starter", a well-documented starting-point for a project, like a boilerplate&mdash;or just a basic tutorial.)

A live version is hosted on [ZEIT Now][now], as <https://defaultwebapp.now.sh>.

...

This repository/project is sort of an update of my previous ["default webapp"][default-webapp-heroku] project, developed in 2014-2015.
Many of the components from that project are now replaced by other preferred components&mdash;e.g. like JavaScript/[React][react]/[Redux][redux] being replaced by [Elm][elm], [Grunt][grunt] being replaced by [webpack][webpack], [Heroku][heroku] being replaced by [ZEIT][zeit]'s [Now][now].
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
1. Install [Node.js][node] (The Node package manager, **_npm_**, is included).

   While at it&mdash;update npm (which release cycle is more frequent than Node.js'):
   
       npm install npm --global

1. Create a project folder, and at that location, open a command line terminal.

### ZEIT Now: Deployment to staging

Deploy/Publish your webapp using [ZEIT Now][now].
Let's get our first version online in an instance:

    now

That fails&mdash;unknown command&mdash;install the ZEIT Now client:

    npm install --global now

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

Check out this easy-to-remember URL in all browsers available!



* * *



## Changelog

### v0.1: Establish project and deploy to ZEIT Now
(See above.)

### v0.x: Project layout & Building with Webpack and npm
TODO: ...

### v0.x: Elm (version 0.19)
TODO: ...

### v0.x: Styling with Sass
TODO: ...

### v0.x: Live reloading & Hot reloading
TODO: ...

### v0.x: Static code analysis
TODO: ...

### v0.x: HTML5 Boilerplate
TODO: ...

### v0.x: The Elm Architecture
TODO: ...

### v0.x: Elm: Communicating with the outside world
TODO: ...

### v0.x: Elm: Using Service Workers
TODO: ...

### v0.x: Elm: "Mobile App" / Progressive Web Applications
TODO: ...

### v0.x: Elm: "Desktop App" / Electron
TODO: ...

### v0.x: ...
TODO: ...



* * *



## Webapp deployment history

Latest greatest, always: <https://defaultwebapp.now.sh>

- v0.1.0: <https://file-pmqnhwkidm.now.sh>
- v0.1.1: <https://file-iomajqiucy.now.sh>
- v0.1.2: <https://file-xkfehobloq.now.sh>
- v0.1.3: <https://file-eswpsfmlgn.now.sh>




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

[atom]: https://atom.io

[ml-family]: https://en.wikipedia.org/wiki/ML_(programming_language)
[elm]: http://elm-lang.org

[node]: https://nodejs.org
[react]: https://reactjs.org
[redux]: https://redux.js.org
[grunt]: https://gruntjs.com
[webpack]: https://webpack.js.org
[sass]: https://sass-lang.com

[default-webapp-heroku]: https://github.com/eirikt/default-webapp-heroku
[inventing-on-principle]: https://vimeo.com/36579366
