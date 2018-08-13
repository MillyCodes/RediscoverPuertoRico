require "sinatra"
require "sinatra/activerecord"
require "sinatra/flash"

# require './models/user.rb'
# require './models/post.rb'
# require './models/tag.rb'

set :database, {adapter: 'postgresql', database: 'pr-blog'}
enable :sessions

# links to all other pages -works, BUT UPDATE ROUTES!
# main index, shows all blog posts and links, SEE 
# IF ALL POST SHOW UP ON LOOP FOR INDEX.ERB FILE
get '/' do
    erb :index
end


get '/' do
    if session[:user_id] 
        erb :homepage
    else
        erb :sign_in
    end
end


# get about page post -route works/erb done
get '/about' do
    erb :about
end

# get contact form/info post -route works/erb NOT done
get '/contact' do
    erb :contact
end


# get single post by id when clicked from main page
# TEST AFTER SEED
get '/single_post' do
    # @specific_post = Post.find(params[:id])
    erb :single_post
end

#show all POSTS BY a specific USER
get '/users/:id' do 

    @specific_user = user.find(params[:id])
    @owners_post = @specific_user.posts
    erb :user_posts
end

# ====LOGIN STUFF====

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


# delete user or post?
# delete '/dogs/:id' do 
#     @current_dog = Dog.find(params[:id])
#     @current_dog.destroy
#     redirect '/dogs'
# end

# private
# private methods?

# def get_current_user 
#     User.find(session[:user_id])
# end