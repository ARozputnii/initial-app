lock '3.14.1'
set :repo_url, 'git@github.com:ARozputnii/initial-app.git'
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :user,        'deployer'
set :application, 'initial_app'
set :rails_env,   'production'
set :deploy_to,   "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :pty,         true

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/master.key', 'config/puma.rb',)
set :linked_dirs,  fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads', 'public/images', 'storage')

set :config_example_suffix, '.example'
set :config_files, %w{config/database.yml}
set :puma_conf, "#{shared_path}/config/puma.rb"

set :nginx_use_ssl, true

set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }

set :rvm_ruby_version, '2.7.1'

namespace :deploy do
  before 'check:linked_files', 'config:push'
  before 'check:linked_files', 'puma:nginx_config'
  after 'puma:smart_restart', 'nginx:restart'
end