# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_robohero_session',
  :secret      => 'ec4086cca3ff85fa4ba2da2c6dee9003541206f28dd0bb9dbbd6b72268e90dd8c38b1e9b0ef438b14cd2430efa4efcc6209b6ade761fc48771f73d65209fcae0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
