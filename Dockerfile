FROM teracy/angular-cli

MAINTAINER hoatle <hoatle@teracy.com>

RUN useradd --user-group --create-home --shell /bin/false app

ENV HOME=/home/app

WORKDIR $HOME

COPY package.json $HOME

WORKDIR $HOME

RUN rm -rf node_modules && npm install && npm cache clean && rm -rf ~/.npm
