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
    @counter = Counter.new(description: params[:description], burn_id: @burn_id)
    if request.xhr? && @counter.save
      erb :_add_counter, layout: false
    else
      erb :_new_counter,layout: false
    end
end

delete '/counter/:id' do
  @counter = Counter.find(params[:id])
  @counter.destroy
    if request.xhr?
      # if current_user.id ==  @counter.user_id
        {id: "/counter/#{@counter.id}"}.to_json 
      # end
    else
      #raise error messages to let them know they have to be
      #the counter creator to delete
    end
  redirect "/burns/#{@counter.burn_id}"
end
