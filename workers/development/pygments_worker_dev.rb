require 'yaml'
$LOAD_PATH.unshift(File.expand_path('../../../app/', __FILE__))

def database_config
  YAML.load(File.open(File.expand_path('../../../config/database.yml', __FILE__)))
end

def params
  {
    "database" => database_config["development"],
    "request" => {"lang" => "ruby", "code" => "def hello\n puts 'hello'\n end"},
    "snippet_id" => 1
  }
end
