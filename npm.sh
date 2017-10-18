#!/bin/sh

npm i -g npm
npm i -g stylelint
npm i -g heroku-cli
npm i -g tern
npm i -g prettier
npm i -g eslint-plugin-prettier
npm i -g eslint-config-prettier
npm i -g javascript-typescript-langserver
npm i -g flow-bin
npm i -g eslint-plugin-flowtype
npm i -g babel-eslint

(
  export PKG=eslint-config-airbnb;
  npm info "$PKG@latest" peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs npm install -g "$PKG@latest"
)
