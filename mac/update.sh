echo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing Brew Stuff"
brew upgrade git
brew upgrade python
brew upgrade terraform
brew upgrade awscli
brew tap caskroom/cask
brew cask upgrade google-cloud-sdk
pip install --upgrade distribute
pip install --upgrade pip
pip install azure

echo "Installing Node Stuff"
brew upgrade node
npm up -g jshint
npm up -g serverless
npm up -g grunt-cli

