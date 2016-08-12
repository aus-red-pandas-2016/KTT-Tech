post '/burns/:id/voteup' do
  @burn = Burn.find(params[:id])
  @burn.votes.create(value: 1)
  if request.xhr?
    {votes: @burn.ponits}.to_json
  else
    redirect "/burns/#{@burn.id}"
  end
end

post '/burns/:id/votedown' do
  @burn = Burn.find(params[:id])
  @burn.votes.create(value: -1)
  if request.xhr?
    {votes: @burn.ponits}.to_json
  else
    redirect "/burns/#{@burn.id}"
  end
end

