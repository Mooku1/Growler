class GrowlsController < ApplicationController
  set :views, Proc.new { File.join(root, "views/growls") }

get '/growls' do
  @growls = Growl.all
  erb :index
end

get '/growls/new' do
  erb :new
end

get '/growls/:id' do
  @growl = Growl.find(params['id'])
  erb :edit
end


post '/growls/new' do
  growl = Growl.new(params["growl"])
  growl.save

  redirect '/growls'
end

patch '/growls/:id/edit' do
  growl = Growl.find(params["id"])
  growl.update(params["growl"])
  growl.save

  redirect "/growls/#{growl.id}"
end

delete '/growls/:id' do
  growl = Growl.find(params['id'])
  growl.destroy
  redirect '/growls'
end




end



