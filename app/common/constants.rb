if ENV['RAILS_ENV'] == 'production'
  APP_URL_ADMIN = "plantik.herokuapp.com/admin" 
else
  APP_URL_ADMIN = "localhost:3000/admin"
end
