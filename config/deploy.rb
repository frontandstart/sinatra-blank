# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'app'

set :repo_url, 'git@yourgitrepository:app.git'

set :appid, "#{fetch :application}_#{fetch :stage}"

set :deploy_to, "/home/#{fetch :user}/#{fetch :appid}/"

set :bundle_path, -> { shared_path.join('vendor/bundle') }

set :linked_files, fetch(:linked_files, []).push('db/production.sqlite3', 'config/database.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp', 'vendor/bundle')

# Here is you can override default capistrano & puma settings
# https://github.com/seuros/capistrano-puma#other-configs

namespace :deploy do
  
  desc "Nginx #{fetch :appid} update"
  # if you have installed nginx in another folder override this /etc/nginx/ path
  task :nginx_restart do
    on roles(:app) do
      execute :sudo, "rm -rf /etc/nginx/sites-enabled/#{fetch :appid}"
      execute :sudo, "ln -nfs ~/#{fetch :appid}/current/config/#{fetch :appid}.conf /etc/nginx/sites-enabled/#{fetch :appid}"
      execute :sudo, "service nginx restart"
    end
  end

  after  :finishing,  :nginx_restart
  
end