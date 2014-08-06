require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick,
    convert_command: 'C:/Ruby200-x64/ImageMagic/convert',    # defaults to "convert"
    identify_command: 'C:/Ruby200-x64/ImageMagic/identify'  # defaults to "identify"
  protect_from_dos_attacks true
  secret "92a3093304fd5b5ad0d1fa716caeae7b02aedd702127ead467f24f6b1526bd05"

  url_format "/media/:job/:name"

  Rails.logger.debug 'Root path: ' + Rails.root.join('public/system/dragonfly', Rails.env).inspect
  if Rails.env.development? || Rails.env.test?
    datastore :file,
      root_path: Rails.root.join('public/system/dragonfly', Rails.env),
      server_root: Rails.root.join('public')
  else
    datastore :s3,
      bucket_name: 'petowners',
      access_key_id: 'insert_key',
      secret_access_key: 'insert_key',
      url_scheme: 'https'
  end
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end