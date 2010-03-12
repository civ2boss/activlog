# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_activlog_session',
  :secret      => '6c1f2f51306cd3806e4855be90022541f5e55b8bae5d17a4097df088a92939e39cc11b46c4073651cea071511c88da89c9d5f91134910e99eb2f0b7297eff1d8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
