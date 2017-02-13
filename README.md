# angular-boilerplate [![Build Status](https://travis-ci.org/teracyhq/angular-boilerplate.svg?branch=master)](https://travis-ci.org/teracyhq/angular-boilerplate)

This project was generated with
[teracy/angular-cli:1.0.0-beta.30](https://hub.docker.com/r/teracy/angular-cli/) Docker image.

This project was created from [angular-boilerplate](https://github.com/teracyhq/angular-boilerplate)
version 0.1.0.

## New project setup

- You need `docker` and `docker-compose` available, so please set up
  [teracy-dev](http://dev.teracy.org/docs/develop/getting_started.html) as the following described
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
$ ./setup.sh # to generate package.json, docker-compose.yml and docker-compose.prod.yml files
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
angular-cli.json
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
Attaching to angularhelloworld_dev_1
dev_1  | Starting virtual X frame buffer: Xvfb.
dev_1  | Executing command bash -c npm run start
dev_1  | npm info it worked if it ends with ok
dev_1  | npm info using npm@3.10.10
dev_1  | npm info using node@v6.9.5
dev_1  | npm info lifecycle angular-hello-world@0.1.0-snapshot~prestart: angular-hello-world@0.1.0-snapshot
dev_1  | npm info lifecycle angular-hello-world@0.1.0-snapshot~start: angular-hello-world@0.1.0-snapshot
dev_1  | 
dev_1  | > angular-hello-world@0.1.0-snapshot start /opt/app
dev_1  | > ng serve --host 0.0.0.0
dev_1  | 
dev_1  | As a forewarning, we are moving the CLI npm package to "@angular/cli" with the next release,
dev_1  | which will only support Node 6.9 and greater. This package will be officially deprecated
dev_1  | shortly after.
dev_1  | 
dev_1  | To disable this warning use "ng set --global warnings.packageDeprecation=false".
dev_1  | 
dev_1  | fallbackLoader option has been deprecated - replace with "fallback"
dev_1  | loader option has been deprecated - replace with "use"
dev_1  | fallbackLoader option has been deprecated - replace with "fallback"
dev_1  | loader option has been deprecated - replace with "use"
dev_1  | fallbackLoader option has been deprecated - replace with "fallback"
dev_1  | loader option has been deprecated - replace with "use"
dev_1  | fallbackLoader option has been deprecated - replace with "fallback"
dev_1  | loader option has been deprecated - replace with "use"
dev_1  | ** NG Live Development Server is running on http://0.0.0.0:4200. **
dev_1  |  69% building modules 698/699 modules 1 active  Hash: c3d11ef93ff9712314cc               
dev_1  | Time: 12942ms
dev_1  | chunk    {0} polyfills.bundle.js, polyfills.bundle.map (polyfills) 222 kB {4} [initial] [rendered]
dev_1  | chunk    {1} main.bundle.js, main.bundle.map (main) 3.87 kB {3} [initial] [rendered]
dev_1  | chunk    {2} styles.bundle.js, styles.bundle.map (styles) 10.1 kB {4} [initial] [rendered]
dev_1  | chunk    {3} vendor.bundle.js, vendor.bundle.map (vendor) 2.62 MB [initial] [rendered]
dev_1  | chunk    {4} inline.bundle.js, inline.bundle.map (inline) 0 bytes [entry] [rendered]
dev_1  | webpack: Compiled successfully.
```

Identify the [vm_ip_address](http://dev.teracy.org/docs/develop/basic_usage.html#ip-address) and
open \<vm_ip_address>:4200 on your browser to start developing. The app will automatically reload
when you change any of the source files.


## Code scaffolding

Open the 4th terminal window and `ssh` into the `teracy-dev` VM:

```
$ cd ~/teracy-dev
$ vagrant ssh
$ ws
$ cd <your_project_name>
$ docker-compose exec dev <ng command>
```

<ng command> could be `ng generate component component-name` to generate a new component. You can
also use `ng generate directive/pipe/service/class/module`.

## Run code linting

Run `$ docker-compose exec dev npm run lint` to execute the code lint checking.

## Run unit tests

Run `$ docker-compose exec dev npm run test` to execute the unit tests via [Karma](https://karma-runner.github.io).

This will keep the tests running and watching the file changes.

To run unit tests without file watching, run `$ docker-compose exec dev ng test --browsers Chrome_no_sandbox -w false`

## Run end-to-end tests

Run `$ docker-compose exec dev npm run e2e` to execute the end-to-end tests via [Protractor](http://www.protractortest.org/).

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

And open \<vm_ip_address>:8080 to see the app in production mode served by nginx.


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
