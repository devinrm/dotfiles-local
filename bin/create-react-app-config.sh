#!/bin/sh

set -e

(
  export PKG=eslint-config-airbnb;
  npm info "$PKG@latest" peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs yarn add --dev "$PKG@latest"
)

yarn add --dev babel-preset-env ;
# yarn add --dev babel-preset-react ;
yarn add --dev babel-preset-stage-2
yarn add --dev eslint-config-prettier ;
yarn add --dev eslint-plugin-flow ;
yarn add --dev eslint-plugin-flowtype ;
yarn add --dev eslint-plugin-no-unsanitized ;
yarn add --dev eslint-plugin-prettier ;
yarn add --dev flow-bin ;
yarn add --dev prettier
