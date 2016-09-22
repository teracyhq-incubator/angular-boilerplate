# angular-boilerplate

The seed project to start working on Angular 2 projects with best practices for Docker, Webpack,
angular-cli, CI, CD, server side rendering, native mobile apps, desktop app, etc.

This project was generated with [docker-angular-cli](https://github.com/teracyhq/docker-angular-cli).

## Getting started

```
$ git clone git@github.com:teracyhq/angular-boilerplate.git --depth=1 <project-name>
```

## Development server

Run `docker-compose up serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

## Code scaffolding

Run `docker-compose run cmd /bin/bash` then `ng generate component component-name` to generate a new component. You can also use `ng generate directive/pipe/service/class`.

## Build

Run `$ docker-compose run cmd /bin/bash` then `ng build` to build the project. The build artifacts will be stored in the `dist/` directory. Use the `-prod` flag for a production build.

## Running unit tests

Run `docker-compose up test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `docker-compose up e2e` to execute the end-to-end tests via [Protractor](http://www.protractortest.org/). 
Before running the tests make sure you are serving the app via `docker-compose serve`.

## Deploying to Github Pages

Run `docker-compose run cmd /bin/bash` then `ng github-pages:deploy` to deploy to Github Pages.

## Further help

To get more help on the `angular-cli` use `ng --help` or go check out the [Angular-CLI README](https://github.com/angular/angular-cli/blob/master/README.md).

## LICENSE

MIT. See the LICENSE file.

