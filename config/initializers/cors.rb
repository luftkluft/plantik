Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:3000',
            '127.0.0.1:3000',
            'https://plantik.herokuapp.com/',
            'https://plantik-dev.herokuapp.com/',
            %r{\Ahttp://192\.168\.0\.\d{1,3}(:\d+)?\z}

    resource '*',
             headers: :any, methods: %i[get post put patch delete options head]
  end
end
