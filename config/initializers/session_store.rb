# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_81SU-web_session',
  :secret      => '3812ab9cf5d757ab4595debd4aa8ecedd81cc2c3c63c3726099d1d79224ea1b1614c7e42b8e220122bde0d236b817f7305286e9edebebf62a113f442c62263c9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
