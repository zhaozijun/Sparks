# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
SPARKs::Application.config.secret_token = ENV["SECRET_TOKEN"] || '24c371b3df2c3fb795f5ef8cf1e23055ee4b1257f8b474611880c71d7e9e50866972cfea65f31106ffff2d2a43615721f14ac3f9343079650f61fa56f6eb4110'
