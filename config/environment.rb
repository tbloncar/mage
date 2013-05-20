# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Mage::Application.initialize!

IMGKit.configure do |config|
  config.wkhtmltoimage = Rails.root.join('bin', 'wkhtmltoimage-amd64').to_s if ENV['RACK_ENV'] == 'production'
end
