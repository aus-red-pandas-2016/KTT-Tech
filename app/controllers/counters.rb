get '/counters/:burn_id/new' do
  @burn_id = params[:burn_id]
  #use ajax to display this partial form
  #partial is _new.erb
end

post '/counters/:burn_id/new' do
    @burn_id = params[:burn_id]
    @counter = Counter.new(description: params[:description])
    @burn = Burn.find(@burn_id)
    @burn << @counter
    if @counter.save
      redirect "/burns/#{@burn_id}"
    else
      erb :'counters/new'
    end
end

delete '/counter/:id' do
  @counter = Counter.find(params[:id])
    if current_user.id ==  @counter.user_id
      @counter.destroy
    else
      #raise error messages to let them know they have to be
      #the counter creator to delete
    end
  redirect "/burns/#{@counter.burn_id}"
end
