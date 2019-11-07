require 'coveralls'
require 'simplecov'
# SimpleCov.formatters = [
#   SimpleCov::Formatter::HTMLFormatter,
#   Coveralls::SimpleCov::Formatter
# ]
Coveralls.wear!
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'database_cleaner'
require 'dox'

require File.expand_path('../config/environment', __dir__)

abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

Dir[Rails.root.join('spec/docs/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.include FactoryBot::Syntax::Methods

  config.before(:each) do |example|
    DatabaseCleaner.strategy = example.metadata[:js] ? :deletion : :transaction
    DatabaseCleaner.start
  end
  config.after(:each) { DatabaseCleaner.clean }

  RSpec.configure do |config|
    config.after(:each, :dox) do |example|
      example.metadata[:request] = request
      example.metadata[:response] = response
    end
  end

  Dox.configure do |config|
    config.header_file_path =
      Rails.root.join('spec/docs/v1/descriptions/header.md')
    config.desc_folder_path = Rails.root.join('spec/docs/v1/descriptions')
    config.headers_whitelist = %w[Accept X-Auth-Token]
  end
end
