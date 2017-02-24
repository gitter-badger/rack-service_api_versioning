#!/usr/bin/env zsh

RBVER=`rbenv version | cut -f 1 -d ' '`
rm -rf .rbenv-gemsets gemsets/{dev,extras,runtime}
mkdir -p $RBENV_ROOT/versions/$RBVER/gemsets/.project-gemsets/dummy_rack-service_api_versioning_dummy
rm -rf $RBENV_ROOT/versions/$RBVER/gemsets/.project-gemsets/*rack-service_api_versioning*
unset RBVER

rbenv gemset init ./gemsets/runtime
gem install prolog-dry_types -v 0.3.2
gem install roda -v 2.22.0
gem install semantic_logger -v 3.4.1
gem install thin -v 1.7.0

rbenv gemset init ./gemsets/dev
echo "./gemsets/dev\n./gemsets/runtime" > .rbenv-gemsets
gem install rake -v 11.3.0
# gem install rake -v 12.0.0
gem install minitest -v 5.10.1
gem install minitest-matchers -v 1.4.1
gem install minitest-reporters -v 1.1.14
gem install minitest-tagz -v 1.5.2

gem install flay -v 2.8.1
gem install flog -v 4.6.1
gem install pry-byebug -v 3.4.2
gem install pry-doc -v 0.10.0
gem install reek -v 4.5.6
gem install rubocop -v 0.47.1
gem install simplecov -v 0.13.0

gem install awesome_print -v 1.7.0
gem install colorator -v 1.1.0

gem install guard -v 2.14.1
gem install guard-livereload -v 2.5.2
gem install guard-minitest -v 2.4.6
gem install guard-rake -v 1.0.0
gem install guard-reek -v 1.0.2
gem install guard-rubocop -v 1.2.0
gem install guard-rubycritic -v 2.9.3
gem install guard-shell -v 0.7.1

# gem install fury -v 0.0.5
rbenv gemset init ./gemsets/extras
echo "./gemsets/extras\n./gemsets/dev\n./gemsets/runtime" > .rbenv-gemsets
rbenv rehash

bundle install --local