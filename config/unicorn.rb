# root = "/home/daul/coffee_letter/current"
# working_directory root
# pid "#{root}/tmp/pids/unicorn.pid"
# stderr_path "#{root}/log/unicorn.err.log"
# stdout_path "#{root}/log/unicorn.out.log"
#  
# # change the YOUR_APP_NAME to your application name
# listen "/tmp/unicorn.coffee_letter.sock"
# worker_processes 2
# timeout 30
# 
# before_exec do |server|
#   ENV["BUNDLE_GEMFILE"] = "#{root}/Gemfile"
# end
# 
# 

root = "/home/daul/coffee_letter/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"

worker_processes 3
timeout 30
preload_app true
listen "/tmp/unicorn.coffee_letter.sock"
before_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to sent QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end