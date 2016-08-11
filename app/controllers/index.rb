get '/' do
  session[:page] = "home"
  redirect '/burns'
end

get '/sign-up' do
  session[:page] = "sign-up"
  erb :sign_up_form
end

post '/sign-up' do
  user = User.create(params[:user])
  if user.save
    session[:user] = user
    redirect "/"
   else
     erb :sign_up_form
   end
end

get '/login' do
  session[:page] = "login"
  erb :login_form
end

post '/login' do
  user = User.find_by(username: params[:username])
  if user.authenticate(params[:password])
    session[:user] = user
    redirect "/"
   else
     #generate errors
     erb :login_form
   end
end

get '/log-out' do
  session[:user] = nil
  redirect '/login'
end

