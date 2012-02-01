# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_nfl_draft_session',
  :secret      => '43ddc6d0570708e0df31922e29c9a98a69beba9037fea887cfc0f596ba100afa46f3eca64d228e1f0228f35d0b3785ced27e97e39a85b83eb67b6a3c2be07dd5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
