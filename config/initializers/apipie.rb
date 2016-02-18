Apipie.configure do |config|
  config.api_base_url = '/api'
  config.app_info = 'QLRace.com API'
  config.app_name = 'QLRace'
  config.doc_base_url = '/apidoc'
  config.layout = 'apidoc.html.slim'
  config.use_cache = Rails.env.production?
  config.validate = false
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/api/**/*.rb"
end
