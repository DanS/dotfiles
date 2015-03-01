require 'yaml'

if File.exist?('plugins.yaml')
  plugins = YAML.load(File.open('plugins.yaml','r').read())
  plugins[:repos].each do |name, url|
    puts 'cloning ' + name
    `cd ~/.janus; git clone #{url}`
  end
end
