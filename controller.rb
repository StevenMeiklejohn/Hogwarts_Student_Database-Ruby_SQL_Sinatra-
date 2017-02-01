require( 'pry-byebug' )
require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'json' )
require_relative( './models/student' )
require_relative( './models/house' )


#homepage
get '/welcome' do
  erb( :welcome )
end
#list of students
get '/welcome/index' do
  @students = Student.all()
  erb( :index )
end
#show specific student
get '/welcome/index/:id' do
  @student = Student.find( params[:id] )
  erb( :show )
end
#edit specific student
get '/welcome/index/:id/edit' do
  @student = Student.find( params[:id] )
  erb( :edit )
end
#persist edit to database.
post '/welcome/index/:id' do
  @student = Student.update( params )
  redirect to( "/welcome/index/#{ params[:id] }" )
end
#delete student.
post '/welcome/index/:id/delete' do
  Student.destroy( params[:id] )
  redirect to( "/welcome/index" )
end

#list houses
get '/welcome/houses' do
  erb( :houses )
end

get '/welcome/houses/:id' do
  @house = House.find( params[:id] )
  @students = House.all_students( params[:id] )
  # @students = @house.all_students( params[:id] )
  erb( :house )
end


