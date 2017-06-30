echo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
sudo xcode-select -switch /usr/bin
sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
echo "Installing Bash Profiles"
cd ~
curl -O https://raw.githubusercontent.com/nicolashery/mac-dev-setup/master/.bash_profile
curl -O https://raw.githubusercontent.com/nicolashery/mac-dev-setup/master/.bash_prompt
curl -O https://raw.githubusercontent.com/nicolashery/mac-dev-setup/master/.aliases

echo "Installing Brew Stuff"
brew install git
brew install python
brew install terraform
brew install node

brew tap caskroom/cask
brew cask install google-cloud-sdk
pip install --upgrade distribute
pip install --upgrade pip
PATH=/usr/local/share/npm/bin:$PATH

echo "Installing Node Stuff"
npm install -g jshint
npm install -g serverless
npm install -g grunt-cli
npm install -g awscli
echo "Installing Software"
curl -s http://www.getmacapps.com/raw/xqq5hwxhgrl | sh