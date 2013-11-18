APP_CONFIG = YAML.load_file("config/config.yml")[Rails.env]
I18n.default_locale = :fr 