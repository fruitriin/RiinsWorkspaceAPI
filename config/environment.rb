# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'
require File.expand_path('../app/libraries/frozen_struct_factory', __dir__)

Rails.application.configure do
  # DB
  config.db = FrozenStructFactory.build(
    name: ENV['DB_NAME'] || 'staging',
    hostname: ENV['DB_HOSTNAME'] || 'db',
    username: ENV['DB_USERNAME'] || 'root',
    password: ENV['DB_PASSWORD'].presence || credentials.call(:database, :password),
    port: ENV['DB_PORT'] || '3306',
    pool: (ENV['DB_POOL'] || 5).to_i,
    timeout: (ENV['DB_TIMEOUT'] || 20_000).to_i
  )
end

# Initialize the Rails application.
Rails.application.initialize!
