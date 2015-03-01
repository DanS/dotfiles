require 'yaml'
#generates yaml file of vim (janus) plugins
#for use by install_plugins.rb

filenames = `cd ~/.janus; ls`.split("\n").map
puts filenames
repos = {}
`find ~/.janus -path "*.git/config" |xargs grep -h url`.split("\n").each do |f|
  name = f.chomp.split('/').last.split('.').first
  repos[name] = f.split('=').last.strip if filenames.include? name
end

hash = {repos: repos}
f = File.open('plugins.yaml', 'w')
f.write hash.to_yaml
puts hash.to_yaml
