# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    #Use the existing token
    File.read(token_file).chomp
  else
    #Generate a new token and store it in token file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end
#SampleApp::Application.config.secret_key_base = '8aea021d4f5add4568e37e64734f341d3cce1d957f31ac8281ba4e8de3c7bdb15f919777bbb84bd0a12f387b985f82d4a74eb3dc05e5284422e33587a856731b'
SampleApp::Application.config.secret_key_base = secure_token
