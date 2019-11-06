if ENV['RAILS_ENV'] == 'production'
  APP_URL_ADMIN = "/admin" 
else
  APP_URL_ADMIN = "localhost:3000/admin"
end
