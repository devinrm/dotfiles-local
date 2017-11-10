#!/bin/sh

(
  export PKG=eslint-config-airbnb;
  npm info "$PKG@latest" peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs npm install -g "$PKG@latest"
)

npm i -g babel-eslint ;
npm i -g eslint-config-prettier ;
npm i -g eslint-plugin-flowtype ;
npm i -g eslint-plugin-no-unsanitized ;
npm i -g eslint-plugin-prettier ;
npm i -g flow-bin ;
npm i -g heroku-cli ;
npm i -g javascript-typescript-langserver ;
npm i -g npm ;
npm i -g prettier ;
npm i -g pure-prompt ;
npm i -g stylelint ;
npm i -g stylelint-config-standard ;
npm i -g stylelint-config-styled-components ;
npm i -g stylelint-processor-styled-components ;
npm i -g tern ;
