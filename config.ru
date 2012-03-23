require 'bundler'
Bundler.setup :default, (ENV['RACK_ENV'] || 'development')

require 'sprockets'
require 'compass'
require 'sprockets-sass'
require 'bootstrap-sass'
require 'sinatra'
require 'coffee-script'
require 'handlebars_assets'

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'assets/javascripts'
  environment.append_path 'assets/stylesheets'
  environment.append_path 'assets/templates'

  environment.append_path 'vendor/assets/javascripts'
  environment.append_path HandlebarsAssets.path
  environment.append_path Compass::Frameworks['bootstrap'].templates_directory + '/../vendor/assets/javascripts'
  run environment
end

require File.dirname(__FILE__) + '/application'

run Jetpack::Application