get '' do

  erb :index
end

get '/burns' do
  @burns = Burn.all
  erb :burn
end

post '/burns' do
  @burn = Burn.create()
end
