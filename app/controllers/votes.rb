post '/burns/:id/vote' do
  Burn = Burn.find(params[:id])
  burn.votes.create(value: 1)
  @votes = burn.votes.count
  p @votes
  if request.xhr?
    {votes: burn.votes.count}.to_json
  else
    redirect "/burns"
  end
end
