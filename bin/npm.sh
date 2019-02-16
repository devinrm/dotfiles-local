#!/bin/sh

set -e

(
  export PKG=eslint-config-airbnb;
  npm info "$PKG@latest" peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs npm install -g "$PKG@latest"
)

npm i -g alex ;
npm i -g babel-cli ;
npm i -g babel-eslint ;
npm i -g create-react-app ;
npm i -g diff-so-fancy
npm i -g eslint-config-prettier ;
npm i -g eslint-plugin-jsx-a11y ;
npm i -g eslint-plugin-no-unsanitized ;
npm i -g eslint-plugin-prettier ;
npm i -g eslint-plugin-react ;
npm i -g heroku-cli ;
npm i -g htmlhint ;
npm i -g javascript-typescript-langserver ;
npm i -g neovim ;
npm i -g npm ;
npm i -g prettier ;
npm i -g prettier-eslint ;
npm i -g prettier-eslint-cli ;
npm i -g pure-prompt ;
npm i -g snyk ;
npm i -g stylelint ;
npm i -g stylelint-config-standard ;
npm i -g stylelint-config-styled-components ;
npm i -g stylelint-processor-styled-components ;
npm i -g tern@0.22.3 ;
npm i -g tern-jsx ;
npm i -g tldr ;
npm i -g @typescript-eslint/eslint-plugin
npm i -g @typescript-eslint/parser
npm i -g write-good ;
