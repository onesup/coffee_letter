require "bundler/capistrano"
#require "delayed/recipes"

server "14.63.162.188", :web, :app, :db, primary: true

set :rails_env, "production" #added for delayed job
set :application, "coffee_letter"
set :user, "daul"
set :deploy_to, "/home/#{user}/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:onesup/#{application}.git"
set :branch, "master"
set :default_environment, {
      'PATH' => "/home/daul/.rbenv/versions/1.9.3-p392/bin/:$PATH"
    }
default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases

# for delayed_job
#after "deploy:stop", "delayed_job:stop"
#after "deploy:start", "delayed_job:start"
#after "deploy:restart", "delayed_job:restart"

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{shared_path}/cached-copy/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    #sudo "rm /etc/nginx/sites-enabled/default"
  end
  after "deploy:setup", "deploy:setup_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; rake db:migrate:reset RAILS_ENV=#{rails_env}; rake db:seed RAILS_ENV=#{rails_env}"
  end
  
  before "deploy", "deploy:check_revision"
end