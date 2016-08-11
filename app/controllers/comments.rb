require 'pry'
get '/comments/new' do
  erb :'comments/new'
end

post '/comments' do
  @comment = Comment.create(description: params[:comment_description], user_id: current_user.id)
  binding.pry
  if request.xhr? && @comment.save
    status 200
    erb(:"/comments/_comment", layout: false, locals: {comment: @comment} )
  elsif request.xhr?
    status 422
  else
    erb :'comments/new'
  end
end
