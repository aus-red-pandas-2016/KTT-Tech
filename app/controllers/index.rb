get '/' do
  redirect '/burns'
end

get '/sign-up' do
  erb :sign_up_form
end

post 'sign-up' do
  user = User.create(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect "/"
   else
     erb :sign_up_form
   end
end

get '/login' do
  erb :login_form
end

post '/login' do
  user = User.find_by(username: params[:username])
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/"
   else
     #generate errors
     erb :login_form
   end
end

get '/log-out' do
  session[:user_id] = nil
  redirect '/login'
end
