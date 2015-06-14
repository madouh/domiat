Model.new(:my_bkp_name, 'Description for my_bkp_name') do
  ##
  # PostgreSQL [Database]
  #
  database PostgreSQL do |db|
    DB = YAML.load_file("#{DIR}/config/database.yml")
    # try to get RAILS_ENV variable, 
    # if it is not set, use 'production'
    RAILS_ENV = ENV.fetch('RAILS_ENV'){'production'}

    # To dump all databases,
    # set `db.name = :all` (or leave blank)
    db.name               = DB[RAILS_ENV]['database']
    db.username           = ENV['PG_USR_NAME']
    db.password           = ENV['PG_APP_DATABASE_PASSWORD'] 
    db.host               = DB[RAILS_ENV]['host']
    db.additional_options = ["-xc", "-E=utf8"]
  end

  ##
  # Amazon Simple Storage Service [Storage]
  #
  store_with S3 do |s3|
    #S3 = YAML.load_file("#{DIR}/config/s3.yml")

    # AWS Credentials
    s3.access_key_id     = 'AKIAJTGVJYZB2AA3QNZQ'
    s3.secret_access_key = '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'

    s3.region            = "us-west-2"
    s3.bucket            = "rails-posts-master"
    s3.path              = "db"
    # max 7 files
    s3.keep              = 7
  end

  ##
  # Gzip [Compressor]
  #
  compress_with Gzip
end