require 'capistrano/setup'
require 'capistrano/deploy'
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git
require 'capistrano/nginx'
require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/rails/migrations'
require 'capistrano/rails/db'
require 'capistrano/rails/console'
require 'capistrano/upload-config'
require 'sshkit/sudo'
require 'capistrano/puma'
install_plugin Capistrano::Puma
require 'capistrano/puma/nginx'
install_plugin Capistrano::Puma::Nginx
require 'capistrano/rails/assets'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }