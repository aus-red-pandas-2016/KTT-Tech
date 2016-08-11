get '/burns' do
  @burns = Burn.order(:created_at)
  erb :burn
end

get '/burns-new' do
  erb :'burns/new'
end

post '/burns' do
    @burn = Burn.create(title: params[:title])
    if @burn.save
      redirect "/burns/#{@burn.id}"
    else
      erb :'burns/new'
    end
end

get '/burns/:id' do
  @burn = Burn.find(params[:id])
  erb :'burns/show'
end

delete '/burns/:id' do
  @burn = Burn.find(params[:id])
  @burn.destroy
end

