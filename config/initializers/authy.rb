require 'authy'

Authy.api_key = ENV["AUTHY_KEY"]
Authy.api_uri = 'https://api.authy.com/'

# puts Authy.api_key