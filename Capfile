require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/nginx'
require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/rails/migrations'
require 'capistrano/rails/db'
require 'capistrano/rails/console'
require 'capistrano/upload-config'
require 'sshkit/sudo'
require 'capistrano/scm/git'
require 'capistrano/puma'
require 'capistrano/puma/nginx'
require 'whenever/capistrano'
require 'capistrano/rails/assets'

install_plugin Capistrano::Puma
install_plugin Capistrano::Puma::Nginx
install_plugin Capistrano::SCM::Git

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
