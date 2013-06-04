#config/unicorn.rb

work_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 15
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself quit instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end
  
after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts "Unicorn working intercepting TERM and doing nothing. Wait for master"
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end

