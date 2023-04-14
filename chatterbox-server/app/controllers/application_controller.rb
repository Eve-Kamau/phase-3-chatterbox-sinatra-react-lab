class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes

#   get '/' do
#     "Hello 👋" :username"
#     "Hi! :username"
#   end
# end

  get '/messages' do
     msgs = Message.all
     msgs.to_json
  end
 
  post '/messages' do
    new_msg = Message.create(
       body: params[:body],
       username: params[:username],)
    new_msg.to_json
  end
  
  patch '/messages/:id' do
    updated_msg = Message.find(params[:id])
    updated_msg.update(
      body: params[:body])
    updated_msg.to_json
  end

  delete '/messages/:id' do
    deleted_msg = Message.find(params[:id])
    deleted_msg.destroy
    deleted_msg.to_json
  end

end
