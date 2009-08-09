require 'mongrel_cluster/recipes'

set :application, "robohero"
set :repository,  "http://#{application}.googlecode.com/svn/trunk/"
set :deploy_via, :remote_cache

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

set :mongrel_conf, "#{current_path}/config/mongrel_cluster.yml"

ssh_options[:port] = 2112

role :app, "67.207.139.110"
role :web, "67.207.139.110"
role :db,  "67.207.139.110", :primary => true

after "deploy", "deploy:cleanup"

task :after_setup do
  run "mkdir #{shared_path}/db"
end