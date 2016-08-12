require 'pry'
get '/counters/:burn_id/new' do
  @burn_id = params[:burn_id]
  if request.xhr?
    erb :_new_counter, layout: false
  else
    redirect "/burns/#{@burn_id}"
  end
end

post '/counters/:burn_id/new' do
    @burn_id = params[:burn_id]
    @counter = Counter.create(description: params[:description], user_id: current_user.id)
    @burn = Burn.find(@burn_id)
    @burn.counters << @counter
    if @burn.save
      # redirect "/burns/#{@burn_id}"
      erb :_add_counter, layout: false
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

post '/counters/comments' do
  @counter = Counter.find(params[:counter_id])
  @comment = @counter.comments.create(description: params[:description], user_id: current_user.id )

  if request.xhr? && @comment.save
    status 200
    erb(:"/counters/_comment", layout: false, locals: {comment: @comment} )
  elsif request.xhr?
    status 422
  else
    erb :'comments/new'
  end
end
