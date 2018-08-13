require "sinatra"
require "sinatra/activerecord"
require "sinatra/flash"

# require './models/user.rb'
# require './models/post.rb'
# require './models/tag.rb'

# set :database, {adapter: 'postgresql', database: 'olympics'}
# enable :sessions

# links to all other pages -works, update routes here
# main index, shows all blog posts and links
get '/' do
    erb :index
end

# get about page post
get '/about' do
    erb :about
end

# get contact form/info post
get '/contact' do
    erb :contact
end


# get single post by id when clicked from main page
get '/single_post' do
    erb :single_post
end

#Sign In Form Route
get '/login' do 
    erb :login
end

# Sign in Route
post '/login' do
    user = User.find_by(username: params[:username])

    #If the user exists, and pw correct, then create a session and redirect them to a logged in page
    if user && user.password == params[:password]
        #Create the cookie with the users id
        session[:user_id] = user.id
        #Print a helpful message
        flash[:info] = "#{user.username} has logged in"
        #redirect to homepage
        redirect '/'
    else 
        flash[:warning] = "Your username does not exist or your password is not correct"
        redirect '/login'
    end
end

#Sign Up Form Route

get '/signup' do 
    erb :sign_up
end

#Sign Up Route

post '/signup' do 
    user = User.create(
        username: params[:username],
        password: params[:password],
        name: params[:name],
        email: params[:email],
        b_day: params[:b_day]
    )
    session[:user_id] = user.id
    redirect '/'
end





get '/' do
    if session[:user_id] 
        erb :homepage
    else
        erb :sign_in
    end
end



# Should show information about all skaters --works
# Each skaters name should link to thier specific page at /skater/:id
# get '/skaters' do
#     @skaters = Skater.all
#     erb :skaters
# end

# Should show information about all judges --works
# Each judges name should link to thier specific page at /judge/:id
# get '/judges' do
#     @judges = Judge.all
#     puts @judges
#     erb :judges
# end

# --works This page should show all the skaters the judge has judged and they score the judge gave them
# get '/judge/:id' do
#     @specific_judge = Judge.find(params[:id])
#     @judge_scores = @specific_judge.scores
#     erb :specific_judge 
# end

# From here you should have a link to the edit page for this specific skater /skater/:id/edit
# get '/skater/:id' do
#     @specific_skater = Skater.find(params[:id])
#     erb :specific_skater   
# end

# NEW This page should allow you to create a new skater and add them to the database and then redirect you to the all skaters page /skaters
# get '/skaters/new' do
#     erb :new_skater

# end

# post '/skaters' do 
#     Skater.create(name: params[:name], nationality: params[:nationality], age: params[:age], photo_url: params[:photo_url], is_favorite: params[:is_favorite], number_of_medals: params[:number_of_medals], average_score: params[:average_score])
#     redirect '/skaters'
# end

# get '/skater/:id/edit' do
#     @current_skater = Skater.find(params[:id])
#     erb :edit_skater
# end

# Update Action -> PUT/PATCH /resource/:id
# put '/skater/:id' do 
#     @current_skater = Skater.find(params[:id])
#     @current_skater.update(name: params[:name], nationality: params[:nationality], age: params[:age], photo_url: params[:photo_url], is_favorite: params[:is_favorite], number_of_medals: params[:number_of_medals], average_score: params[:average_score])
# end

# delete '/skater/:id' do 
#     @current_skater = Skater.find(params[:id])
#     @current_skater.destroy
#     redirect '/skaters'
# end