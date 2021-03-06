get '/burns' do
  @burns = Burn.all.map{ |burn| burn }.sort_by!{ |burn| burn.points }.reverse
  erb :'burns/burn'
end

get '/burns-new' do
  erb :'burns/new'
end

post '/burns' do
    @burn = Burn.new(title: params[:title], burn_description: params[:burn_description], user_id: current_user.id)
    if @burn.save
      redirect "/burns/#{@burn.id}"
    else
      erb :'burns/new'
    end
end

get '/burns/:id' do
  session[:page] = 'burn'
  @burn = Burn.find(params[:id])
  @burn_comments = @burn.comments.order(:created_at)
  @counters = @burn.counters.order(:created_at)
  erb :'burns/show'
end

delete '/burns/:id' do
  @burn = Burn.find(params[:id])
  @burn.destroy
end
