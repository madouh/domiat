
task :backup do
  dir = File.expand_path('../../../', __FILE__)
  Bundler.with_clean_env do
    system "cd #{dir}/vendor/backup/; backup perform --trigger my_bkp_name --config-file ./config.rb"
  end
end