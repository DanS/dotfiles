#!/usr/bin/env ruby
require 'pp'
require 'yaml'

homebrew_binaries = `brew ls`.split
applications = `\ls /Applications`.gsub(".app", "").split("\n")
node_packages = `npm -g ls --parseable --depth 0`.gsub("/usr/local/lib", "").gsub("/node_modules/", "").split

def cask_has_app?(app)
  `brew cask search '#{app}'`["==> Exact match"]
end

brew_cask_installed = system("file /opt/homebrew-cask")
unless brew_cask_installed
  puts "Please install homebrew cask before continuing"
  exit 1
end

homebrew_cask_applications = applications.select do |app|
  cask_has_app?(app)
end

kitchenplan_config = {
  recipes: {
    mac_os_x: "- osxdefaults::set_computer_name"
  },
  attributes: {
    git: {
      name: `git config --global --get user.name`,
      email:  `git config --global --get user.email`
    },
    osxdefaults: {
      computername: `hostname`
    },
    homebrewalt: {
      apps: homebrew_binaries,
      cask_apps: homebrew_cask_applications
    },
    nodejs: {
      apps: node_packages
    }
  }
}

puts kitchenplan_config.to_yaml
