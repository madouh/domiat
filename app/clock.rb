require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

include Clockwork

if Rails.env.production?
  every(1.day, 'database_backup', at: '01:03') do
    dir = File.expand_path('../../', __FILE__)
    Bundler.with_clean_env do
      #system "cd #{dir}/vendor/backup/; bundle exec backup perform --trigger my_bkp_name --config-file ./config.rb"
      puts "task ok"
    end
  end
end

def execute_rake(file,task)
  require 'rake'
  rake = Rake::Application.new
  Rake.application = rake
  Rake::Task.define_task(:environment)
  load "#{Rails.root}/lib/tasks/#{file}"
  rake[task].invoke
  puts "Invoked"
end

if Rails.env.production?
  every(5.minutes, 'database_backup') { execute_rake "db.rake", 'backup' }
end