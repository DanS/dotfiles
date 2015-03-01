find ~/.janus -path "*.git/config" |xargs grep -h url > ./remote_urls.txt
cat ~/dotfiles/remote_urls.txt
