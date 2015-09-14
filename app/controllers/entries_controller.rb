get '/entries' do
  @entries = Entry.most_recent

  erb :'entries/index'
end

get '/entries/new' do
  erb :'entries/new'
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

get '/entries/:id' do
  begin
    @entry = Entry.find(params[:id])
    erb :'entries/show'
  rescue ActiveRecord::RecordNotFound
    redirect '/entries'
  end
end

get '/entries/:id/edit' do
  begin
    @entry = Entry.find(params[:id])
    erb :'entries/edit'
  rescue ActiveRecord::RecordNotFound
    redirect '/entries'
  end
end

put '/entries/:id' do
  begin
    @entry = Entry.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect '/entries'
  end

  @entry.assign_attributes(params[:entry])

  if @entry.save
    redirect "entries/#{@entry.id}"
  else
    @errors = @entry.errors.full_messages
    erb :'entries/edit'
  end
end

delete '/entries/:id' do
  begin
    @entry = Entry.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect '/entries'
  end

  @entry.destroy
  redirect '/entries'
end
