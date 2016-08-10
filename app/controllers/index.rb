get '/' do
  # @users = User.all
  erb :index
end

get '/sign-up' do

  erb :sign_up_form
end

post 'sign-up' do

  redirect '/'
end

get '/login' do

  erb :login_form
end

post '/login' do

  redirect '/'
end
