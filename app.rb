require "sinatra"
# require_relative "./add"
# require_relative "./diveded"
# require_relative "./mutply"
# require_relative "./subtract"

get "/" do 
    erb :login, locals: {error: ""}
end 

post '/login' do
  username = params[:user_nam]
  password = params[:p_word]
  error_msg = "Wrong Username or Password:"
    if username == "bootyjack1234" ; password == "bootymeat1234"
        redirect '/first_last?user_nam='+ username + '&p_word='+ password 
    elsif username == "bootymarv1234" ; password == "bootymarv1234"
        redirect '/first_last?user_nam='+ username + '&p_word='+ password
    elsif username == "bootygritts1234" ; password == "bootygritts1234"
        redirect '/first_last?user_nam='+ username + '&p_word='+ password
    else 
        erb :login, locals: {error: error_msg}
    end
end 

get '/first_last' do 
    erb :first_last
end 

post '/first_last' do 
    first_name = params[:f_name]
    last_name = params[:l_name]
    redirect '/first_num?f_name='+ first_name + '&l_name='+ last_name
end 

get '/first_num' do
    first_name = params[:f_name]
    last_name = params[:l_name]
    erb :first_num, locals: {f_name: first_name, l_name: last_name}
end

post '/first_num'do
    first_name = params[:f_name]
    last_name = params[:l_name]
    first_num = params[:first_num]
    redirect '/equaz?f_name='+ first_name + '&l_name='+ last_name, '&first_num='+ first_num
end


