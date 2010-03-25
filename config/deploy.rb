set :application, "QC Daily Visitor's Log"
set :repository,  "git@github.com:civ2boss/activlog.git"

set :scm, :git
set :user, "rting"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "activlog.local"                          # Your HTTP server, Apache/etc
role :app, "activlog.local"                          # This may be the same as your `Web` server
role :db,  "activlog.local", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :branch, "master"
set :deploy_to, "/Users/rting/code/activlog_deploy"
set :deploy_via, :remote_cache

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end