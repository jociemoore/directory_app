require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get '/' do 
  @files = Dir.entries("public").select { |file| !File.directory?(file) }
  @other_order = 'descending'
  erb :directory
end

get '/order/descending' do 
  @files = Dir.entries("public").select { |file| !File.directory?(file) }
  @files = @files.sort { |a,b| b <=> a }
  @other_order = 'ascending'
  erb :directory
end

get '/order/ascending' do 
  @files = Dir.entries("public").select { |file| !File.directory?(file) }
  @other_order = 'descending'
  erb :directory
end