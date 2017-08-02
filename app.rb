require "sinatra"
require_relative "add.rb"
require_relative "dived_1.rb"
require_relative "math.rb"
require_relative "submath.rb"
enable :sessions

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
    elsif username == "test" ; password == "1234"
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
    first_number = params[:f_num]
    # "#{first_name} #{last_name} #{first_number}"
    redirect '/sec_num?f_name='+ first_name + '&l_name='+ last_name + '&f_num='+ first_number
end

get '/sec_num' do
    first_name = params[:f_name]
    last_name = params[:l_name]
    first_number = params[:f_num]
    erb :second_num, locals: {f_name: first_name, l_name: last_name, f_num: first_number}
end

post '/second_num' do
    first_name = params[:f_name]
    last_name = params[:l_name]
    first_number = params[:f_num]
    second_num = params[:s_num]
    # "#{first_name} #{last_name} #{first_number} #{second_num}"
    redirect '/equaz?f_name='+ first_name + '&l_name='+ last_name + '&f_num='+ first_number + '&s_num='+ second_num
end
    
get '/equaz' do
    first_name = params[:f_name]
    last_name = params[:l_name]
    first_number = params[:f_num]
    second_num = params[:s_num]
    # "#{first_number} #{second_num}"
    erb :equaz, locals: {f_name: first_name, l_name: last_name, f_num: first_number, s_num: second_num} 
end

post '/equat' do
    first_name = params[:f_name]
    last_name = params[:l_name]
    first_number = params[:f_num]
    second_num = params[:s_num]
    result = params[:re_sult]
    session[:porduct] = params[:equation]
    if session[:porduct] == "+"
        result = add1(first_number.to_i, second_num.to_i)
    #    p "#{porduct} yo look here"
    elsif session[:porduct] == "-"
        result = subtract(first_number.to_i, second_num.to_i)
    elsif session[:porduct] == "/"
        result = divide(first_number.to_i, second_num.to_i)
    else session[:porduct] == "*" 
        result = multiple(first_number.to_i, second_num.to_i)
    end
    # "#{first_name} #{last_name} #{first_number} #{second_num} #{operater} this is what your lookin at #{result}  #{porduct}"
     redirect '/final?f_name='+ first_name + '&l_name='+ last_name + '&f_num='+ first_number + '&s_num='+ second_num + '&re_sult='+ result.to_s
end

get '/final' do
    first_name = params[:f_name]
    last_name = params[:l_name]
    first_number = params[:f_num]
    second_num = params[:s_num]
    operater = session[:porduct]
    results = params[:re_sult]
    erb :results, locals: {f_name: first_name, l_name: last_name, f_num: first_number, s_num: second_num, equation: operater, re_sult: results}
#    "#{first_name} #{last_name} #{first_number} #{second_num} #{operater} this is what your lookin at #{results} "
end

post '/rerun' do
    choice = params[:answer]
    first_name = params[:f_name]
    last_name = params[:l_name]
    if choice == "yes1"
    redirect '/first_num?f_name='+ first_name + '&l_name='+ last_name 
elsif choice == "no1"
    "thank you have a good day"
end
end










     
     




