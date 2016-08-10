get '/burns' do
  @burns = Burn.all
  erb :burn
end

post '/burns' do
  @burn = Burn.create(title: params[:title])
  if request.xhr? && burn.save
    status 200
    erb(:_new_burn, layout: false)
  elsif request.xhr?
    status 422
  else
    redirect '/burns'
  end

end

get '/burns/:id' do
  @burn = Burn.find(params[:id])
  erb :burn
end

delete '/burns/:id' do
  @burn = Burn.find(params[:id])
  @burn.destroy
end
