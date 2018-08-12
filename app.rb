require "sinatra"
require "sinatra/activerecord"

# require './models/judge.rb'
# require './models/skater.rb'
# require './models/score.rb'

# set :database, {adapter: 'postgresql', database: 'olympics'}

# links to all other pages --works

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



# get single post by id
get '/single_post' do
    erb :single_post
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