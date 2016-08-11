post '/comments' do
  @comment = Comment.new(description: params[:description])
  if @comment.save
    redirect "/burns/#{@burn.id}"
  else
    erb :'comments/new'
  end
end
