post '/burns/:id/voteup' do
  @burn = Burn.find(params[:id])
  @burn.votes.create(value: 1)
  if request.xhr?
    {points: @burn.points}.to_json
  else
    redirect "/burns/#{@burn.id}"
  end
end

post '/burns/:id/votedown' do
  @burn = Burn.find(params[:id])
  @burn.votes.create(value: -1)
  if request.xhr?
    {points: @burn.points}.to_json
  else
    redirect "/burns/#{@burn.id}"
  end
end

post '/counters/:id/voteup' do
  params[:id].slice!(0)
  @counter = Counter.find(params[:id])
  @counter.votes.create(value: 1)
  if request.xhr?
    {points: @counter.points}.to_json
  else
    redirect "/counters/#{@counter.id}"
  end
end

post '/counters/:id/votedown' do
  params[:id].slice!(0)
  @counter = Counter.find(params[:id])
  @counter.votes.create(value: -1)
  if request.xhr?
    {points: @counter.points}.to_json
  else
    redirect "/counters/#{@counter.id}"
  end
end

