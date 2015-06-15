# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

#require "heroku_backup_task/tasks"

# namespace :heroku do
#   desc "PostgreSQL database backups from Heroku to Amazon S3"
#   task :backup => :environment do
#     begin
#       require 'right_aws'
#       puts "[#{Time.now}] heroku:backup started"
#       name = "#{ENV['APP_NAME']}-#{Time.now.strftime('%Y-%m-%d-%H%M%S')}.dump"
#       db = ENV['DATABASE_URL'].match(/postgres:\/\/([^:]+):([^@]+)@([^\/]+)\/(.+)/)
#       system "PGPASSWORD=#{db[2]} pg_dump -Fc --username=#{db[1]} --host=#{db[3]} #{db[4]} > tmp/#{name}"
#       s3 = RightAws::S3.new(ENV['S3_ACCESS_KEY_ID'], ENV['S3_SECRET_ACCESS_KEY'])
#       bucket = s3.bucket("#{ENV['APP_NAME']}-heroku-backups", true, 'private')
#       bucket.put(name, open("tmp/#{name}"))
#       system "rm tmp/#{name}"
#       puts "[#{Time.now}] heroku:backup complete"
#     # rescue Exception => e
#     #   require 'toadhopper'
#     #   Toadhopper(ENV['hoptoad_key']).post!(e)
#     end
#   end
# end
 
# task :cron => :environment do
#   Rake::Task['heroku:backup'].invoke
# end
#require 'aws-sdk'
#require 'rubygems'
require 'aws/s3'

#include AWS::S3

 task :connect_to_s3 do
    AWS::S3.new(
      :access_key_id     => ENV['S3_ACCESS_KEY_ID'],
      :secret_access_key => ENV['S3_SECRET_ACCESS_KEY'])
    begin
      AWS::S3.Bucket.find(HEROKU_BACKUP_BUCKET)
    rescue AWS::S3.NoSuchBucket
      AWS::S3.Bucket.create(HEROKU_BACKUP_BUCKET)
    end
  end