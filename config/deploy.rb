lock '3.14.1'

set :application, 'initial_app'
set :repo_url, 'git@github.com:ARozputnii/initial-app.git'
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :user, 'deployer'
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :pty, true

set :rvm_ruby_version, '2.7.1'

append :linked_files, 'config/database.yml', 'config/puma.rb', 'config/master.key'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads'

set :config_example_suffix, '.example'
set :config_files, %w{config/database.yml}
set :puma_conf, "#{shared_path}/config/puma.rb"

namespace :deploy do
  # before 'check:linked_files', 'config:push'
  # before 'check:linked_files', 'puma:jungle:setup'
  # before 'check:linked_files', 'puma:nginx_config'
  after 'puma:smart_restart', 'nginx:restart'
  after 'deploy:finished', 'set:restart_puma'
end
bundle_wrapper_path = "/home/deployer/.rvm/gems/ruby-2.6.5/wrappers/bundle"

namespace :set do
  desc "Restart puma"
  task :restart_puma do
    on roles(:app), in: :sequence, wait: 10 do
      execute "cd #{release_path} && #{bundle_wrapper_path} exec pumactl -P #{shared_path}/tmp/pids/puma.pid restart" end
  end
end

