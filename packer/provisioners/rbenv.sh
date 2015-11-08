#!/bin/bash -eux

echo '====> install rbenv'
git clone git://github.com/sstephenson/rbenv.git /usr/local/rbenv
echo '====> install ruby-build'
git clone git://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build
echo '====> install rbenv-gem-rehash'
# git clone https://github.com/sstephenson/rbenv-gem-rehash.git /usr/local/rbenv/plugins/rbenv-gem-rehash

echo 'export RBENV_ROOT="/usr/local/rbenv"
export PATH="${RBENV_ROOT}/bin:${PATH}"
eval "$(rbenv init -)"
export RBENV_ROOT="/usr/local/rbenv"
export PATH="${RBENV_ROOT}/bin:${PATH}"
eval "$(rbenv init -)"
' > /etc/profile.d/rbenv.sh
source /etc/profile.d/rbenv.sh

echo 'install rbenv the path below'
whereis rbenv

version=`rbenv install -l |egrep "^\s*[1-9]" |egrep -v "(preview|dev|rc)" |tail -n 1`
echo "install ruby-${version}"
rbenv install $version
rbenv global $version

echo 'install bundler'
gem install bundler
