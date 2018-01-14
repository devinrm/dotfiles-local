#!/bin/sh

set -e

prettier "app/assets/javascripts/**/*.js" --single-quote --trailing-comma all --parser flow --write ;

prettier "react/components/**/*.js" --single-quote --trailing-comma all --parser flow --write ;

prettier "react/components/**/*.jsx" --single-quote --trailing-comma all --parser flow --write ;

stylelint "app/assets/stylesheets/*.scss" --fix ;

stylelint "react/stylesheets/*.css" --fix ;

stylelint "react/stylesheets/*.scss" --fix ;

rubocop --auto-correct
