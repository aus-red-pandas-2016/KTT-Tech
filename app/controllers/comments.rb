get '/comments-new' do
  erb :'comments/new'
end

post '/comments' do
  @comment = Comment.new(description: params[:description])
  if @comment.save
    redirect "/burns/#{@comment.commentable_id}"
  else
    erb :'comments/new'
  end
end
