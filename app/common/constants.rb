APP_URL_ADMIN = if ENV['RAILS_ENV'] == 'production'
                  '/admin'
                else
                  'localhost:3000/admin'
                end
