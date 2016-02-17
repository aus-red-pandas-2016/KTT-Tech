# route handlers dealing with the collection
get '/entries' do
  @entries = Entry.most_recent
  erb :'entries/index'
end

post '/entries' do
  @entry = Entry.new(params[:entry])

  if @entry.save
    redirect "/entries/#{@entry.id}"
  else
    @errors = @entry.errors.full_messages
    erb :'entries/new'
  end
end

get '/entries/new' do
  erb :'entries/new'
end


# route handlers dealing with a specific entry
before '/entries/:id' do
  pass if request.path_info.match /new/
  @entry = find_and_ensure_entry(params[:id])
end

get '/entries/:id' do
  erb :'entries/show'
end

put '/entries/:id' do
  @entry.assign_attributes(params[:entry])

  if @entry.save
    redirect "entries/#{@entry.id}"
  else
    @errors = @entry.errors.full_messages
    erb :'entries/edit'
  end
end

delete '/entries/:id' do
  @entry.destroy
  redirect '/entries'
end

get '/entries/:id/edit' do
  @entry = find_and_ensure_entry(params[:id])
  erb :'entries/edit'
end
