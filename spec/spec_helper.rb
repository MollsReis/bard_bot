$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'bard_bot'
require 'bundler/setup'
Bundler.require :spec
