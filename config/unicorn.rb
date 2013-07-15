root = "/home/daul/coffee_letter/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.err.log"
stdout_path "#{root}/log/unicorn.out.log"
 
# change the YOUR_APP_NAME to your application name
listen "/tmp/unicorn.coffee_letter.sock"
worker_processes 2
timeout 30

before_exec do |server|
  ENV["BUNDLE_GEMFILE"] = "#{root}/Gemfile"
end