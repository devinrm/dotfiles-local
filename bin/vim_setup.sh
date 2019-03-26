#!/bin/sh

set -e

npm i -g babel-eslint ;
npx install-peerdeps --dev eslint-config-airbnb
npm i -g eslint-config-prettier ;
npm i -g eslint-plugin-jsx-a11y ;
npm i -g eslint-plugin-no-unsanitized ;
npm i -g eslint-plugin-prettier ;
npm i -g eslint-plugin-react ;
npm i -g javascript-typescript-langserver ;
npm i -g neovim ;
npm i -g prettier ;
npm i -g prettier-eslint ;
npm i -g stylelint ;
npm i -g stylelint-order ;
npm i -g stylelint-scss ;
npm i -g typescript ;
npm i -g tslint ;
npm i -g tslint-config-prettier ;
npm i -g tslint-react ;

gem install neovim ;
gem install brakeman ;
gem install rubocop ;
gem install rails_best_practices ;
gem install rubocop-rspec ;
