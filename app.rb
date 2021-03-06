require "sinatra"
require "sinatra/activerecord"
require "sinatra/flash"

require './models/user.rb'
require './models/post.rb'
require './models/tag.rb'
require './models/post_tag.rb'


enable :sessions

# links to all other pages -works!
# main index, shows all blog posts and links, SEE 
# IF ALL POST SHOW UP ON LOOP FOR INDEX.ERB FILE
get '/' do
    @posts = Post.order("id desc")
    erb :index
end


# get about page post -route works/erb done
get '/about' do
    erb :about
end

# get contact form/info post -route works/erb NOT done
get '/contact' do
    erb :contact
end


# ====SHOW & CREATE NEW POSTS======

  #Index Action -> GET /resource
get '/posts' do 
    @posts = Post.all
    erb :posts
end

get '/post/new' do
    erb :new_post
  end

# get single post by id when clicked from main page
# WORKS!
get '/post/:id' do
    @specific_post = Post.find(params[:id])
    @post_author = @specific_post.user
    erb :post
end

post '/posts' do
    Post.create(
        title: params[:title],
        content: params[:content],
        user_id: session[:user_id],
        image: params[:image])
    redirect '/'
  end

#Edit Action -> GET /resource/:id/edit
get '/post/:id/edit' do
    @current_post = Post.find(params[:id])
    erb :edit_post
end

put '/post/:id' do 
    @current_post = Post.find(params[:id])
    @current_post.update(title: params[:title], content: params[:content], image: params[:image])
    redirect "/post/#{@current_post.id}"
end


# =======SHOW USER PROFILE/POSTS BY a specific USER=======
get '/users' do
    @users = User.all
    erb :users
end



get '/user/:id' do 
    @specific_user = User.find(params[:id])
    @owners_posts = @specific_user.posts.order("created_at desc")
    erb :user
end

delete '/user/:id' do 
    @specific_user = User.find(params[:id])
    @specific_user.destroy
    session[:user_id] = nil
    redirect '/'
end

# ====LOGIN STUFF====

#Sign In Form Route DONE
get '/login' do 
    erb :login
end

# Sign in Route DONE
post '/login' do
    user = User.find_by(username: params[:username])

    #If the user exists, and pw correct, then create a session and redirect them to a logged in page
    if user && user.password == params[:password]
        #Create the cookie with the users id
        session[:user_id] = user.id
        #Print a helpful message
        flash[:info] = "#{user.username} has logged in"
        #redirect to homepage
        redirect "/user/#{user.id}"
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
    redirect "/user/#{user.id}"
end

# when hitting this get path via a link
#   it would reset the session user_id and redirect
#   back to the homepage
get "/logout" do
    # this is the line that signs a user out
    session[:user_id] = nil
  
    # lets the user know they have signed out
    flash[:info] = "You have been signed out"
    
    redirect "/"
  end



# private methods
private

def get_current_user 
    User.find(session[:user_id])
end

def get_recent_posts
    @posts = Post.order("created_at desc").limit(3)
end

def post_count
    Post.all.count
end