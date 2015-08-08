require './app'

run JuiceFm::App

map "/fonts" do
  run Rack::Directory.new("./app/assets/fonts")
end
