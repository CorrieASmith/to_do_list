require('sinatra')
require('sinatra/reloader')
require('./lib/to_do_list')

also_reload('lib/**/*.rb')

get("/") do
  @tasks = Task.all()
  erb(:index)
end

post("/add") do
  description = params.fetch('description')
  Task.new(description).save()
  @tasks = Task.all()
  erb(:index)
end

get("/delete") do
  index = params.fetch('index').to_i
  Task.delete(index)
  @tasks = Task.all()
  erb(:index)
end
