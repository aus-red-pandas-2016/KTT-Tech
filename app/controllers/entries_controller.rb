get '/entries' do
  @entries = Entry.most_recent

  erb :'entries/index'
end
