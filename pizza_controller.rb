require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza')

get '/pizzas' do
  @pizzas = Pizza.all
  erb(:index)
end

get '/pizzas/new' do
  erb(:new)
end

get '/pizzas/:id/edit' do
  @pizza = Pizza.find(params[:id])
  erb(:update)
end

post '/pizzas' do
  @pizza = Pizza.new(params)
  @pizza.save
  erb(:create)
end

post '/pizzas/:id/delete' do
  @pizza = Pizza.new(params)
  @pizza.delete
  erb(:delete)
end

post '/pizzas/:id' do
  @pizza = Pizza.new(params)
  @pizza.update
  erb(:edit)
end

get '/pizzas/:id' do
  @pizza = Pizza.find(params[:id])
  erb(:show)
end
