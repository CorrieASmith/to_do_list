require('sinatra')
require('sinatra/reloader')
require('./lib/to_do_list')

also_reload('lib/**/*.rb')

get("/") do
  @tasks = Task.all()
  erb(:index)
end
