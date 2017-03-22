# angular-boilerplate [![Build Status](https://travis-ci.org/teracyhq/angular-boilerplate.svg?branch=develop)](https://travis-ci.org/teracyhq/angular-boilerplate)

This project was generated with
[teracy/angular-cli:1.0.0-rc.2](https://hub.docker.com/r/teracy/angular-cli/) Docker image.

This project was created from [angular-boilerplate](https://github.com/teracyhq/angular-boilerplate)
version 0.2.0.

## New project setup

- You need `docker` and `docker-compose` available, so please set up
  [teracy-dev](http://dev.teracy.org/docs/getting_started.html) as the following described
  steps works with `teracy-dev`. Note that the 1st terminal window after `$ vagrant up` should be
  kept running for file watching.

- Open the 2nd terminal window, git remote add `angular-boilerplate` repo as `seed` and pull the
  stable branch (master) or development branch (develop) into your project.

```
$ cd ~/teracy-dev/workspace
$ mkdir <your_project_name>
$ cd <your_project_name>
$ git init
$ git remote add seed https://github.com/teracyhq/angular-boilerplate.git
$ git pull seed master # or develop branch if you want to have the latest development features
$ cp .env.example .env # and adjust the variables matching your project details
```

For example, if your project name is `angular-hello-world`, your Docker hub account `hoatle`:

```
# export environment variables to be used for the project-specific stuff
# how to use: $ export $(cat .env | grep -v ^# | xargs)

# for package.json
PROJECT_NAME=angular-hello-world
PROJECT_VERSION=0.1.0-SNAPSHOT

# for docker-compose.yml and docker-compose.prod.yml
DEV_DOCKER_IMAGE=hoatle/angular-hello-world:dev_develop
PROD_DOCKER_IMAGE=hoatle/angular-hello-world:develop
```

These variables are used to generate project specific files, you can adjust them accordingly.


After that, open the 3rd terminal window, `ssh` into the `teracy-dev` VM:

```
$ cd ~/teracy-dev
$ vagrant ssh
$ ws
$ cd <your_project_name>
$ export $(cat .env | grep -v ^# | xargs) # to export enviroment variables defined on the .env file
$ ./setup.sh # to generate .angular-cli.json, package.json, docker-compose.yml and docker-compose.prod.yml files
```

Execute the following command to
[sync back](http://dev.teracy.org/docs/develop/basic_usage.html#file-sync) the generated files on
the 2nd terminal window:

```
$ vagrant rsync-back
```

After that, you should see `package.json`, `docker-compose.yml` and `docker-compose.prod.yml` files
available.

Remove these lines from `.gitignore` to keep these files on your project:

```
# angular-boilerplate
.env
.angular-cli.json
package.json
docker-compose.yml
docker-compose.prod.yml
```

## Development server

Execute the following commands on the 3rd `ssh-ed` terminal window:

```
$ docker-compose build && docker-compose up -d && docker-compose logs -f
```

Note that `$ docker-compose pull` should be used instead of `$ docker-compose build` when the
`DEV_DOCKER_IMAGE` is available. Your CI system should be used to push these development and production
Docker images. (See .travis.yml for reference)

You should see the similar following output:

```
Creating angular-boilerplate-dev
Attaching to angular-boilerplate-dev
angular-boilerplate-dev | Starting virtual X frame buffer: Xvfb.
angular-boilerplate-dev | Executing command bash -c yarn run start
angular-boilerplate-dev | yarn run v0.21.3
angular-boilerplate-dev | $ ng serve --host=0.0.0.0 
angular-boilerplate-dev | ** NG Live Development Server is running on http://0.0.0.0:4200 **
angular-boilerplate-dev Hash: d8df844d0c9cdfe14f5e                                                               s
angular-boilerplate-dev | Time: 14272ms
angular-boilerplate-dev | chunk    {0} polyfills.bundle.js, polyfills.bundle.js.map (polyfills) 157 kB {4} [initial] [rendered]
angular-boilerplate-dev | chunk    {1} main.bundle.js, main.bundle.js.map (main) 4.04 kB {3} [initial] [rendered]
angular-boilerplate-dev | chunk    {2} styles.bundle.js, styles.bundle.js.map (styles) 9.89 kB {4} [initial] [rendered]
angular-boilerplate-dev | chunk    {3} vendor.bundle.js, vendor.bundle.js.map (vendor) 2.69 MB [initial] [rendered]
angular-boilerplate-dev | chunk    {4} inline.bundle.js, inline.bundle.js.map (inline) 0 bytes [entry] [rendered]
angular-boilerplate-dev | webpack: Compiled successfully.
```

Open teracy.dev:4200 on your browser to start developing. The app will automatically reload
when you change any of the source files.


## Code scaffolding

Open the 4th terminal window and `ssh` into the `teracy-dev` VM:

```
$ cd ~/teracy-dev
$ vagrant ssh
$ ws
$ cd <your_project_name>
$ docker-compose run --rm dev <ng command>
```

<ng command> could be `ng generate component component-name` to generate a new component. You can
also use `ng generate directive/pipe/service/class/module`.

Remember to sync back the generated files to the host machine with `$ vagrant rsync-back`:
http://dev.teracy.org/docs/basic_usage.html#file-sync

## Run code linting

Run `$ docker-compose run --rm dev yarn run lint` to execute the code lint checking.

## Run unit tests

Run `$ docker-compose run --rm dev yarn run test` to execute the unit tests via [Karma](https://karma-runner.github.io).

This will keep the tests running and watching the file changes.

To run unit tests without file watching, run `$ docker-compose run --rm dev ng test --browsers Chrome_no_sandbox -w false`

## Run end-to-end tests

Run `$ docker-compose run --rm dev yarn run e2e` to execute the end-to-end tests via [Protractor](http://www.protractortest.org/).

## Run the bash command on the running Dev Docker image

Run `$ docker-compose exec dev /bin/bash`


## Build the Prod Docker image

On the 4th terminal `ssh-ed` terminal window:

```
$ docker-compose exec dev ng build --prod
$ docker-compose -f docker-compose.prod.yml build
```

to build the project and the prod Docker image. The build artifacts will be stored in the `dist/`
directory.

Don't forget to sync back the generated files from the VM to the host after the build if you want
to check the `dist/` directory.

## Run the Prod Docker image

```
$ docker-compose -f docker-compose.prod.yml up
```

And open teracy.dev:8080 to see the app in production mode served by nginx.


## Contribute to angular-boilerplate project

- Fork the repo

- Enable this repo on travis-ci.org with the following settings key - value.
  In the *Name* and *Value* fields, please add the info below correlatively: 
  + Fill in "DOCKER_IMAGE" into the *Name* field, and project Docker image for *Value*, for example, "hoatle/angular-boilerplate" value (will be pushed to https://hub.docker.com/r/hoatle/angular-boilerplate/)
  + Fill in "DOCKER_USERNAME" into the *Name* field and your Docker username into the *Value* field
  + Fill in "DOCKER_PASSWORD" into the *Name* field and your Docker password into the *Value* field

- Test, Fix bug, Improve, Add new features on the project issues with pull requests.

## Further help

To get more help on the `angular-cli` use `ng help` or go check out the
[Angular-CLI README](https://github.com/angular/angular-cli/blob/master/README.md).

## License

MIT, see the LICENSE file.
