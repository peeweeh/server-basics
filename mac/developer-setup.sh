echo "Developer Setup"
echo "Installing Xcode"
xcode-select --install

echo "Installing Bash Profiles"
cp -r ../general/super_bash/.bash_profile ~/
cp -r ../general/super_bash/.bash_prompt ~/
cp -r ../general/super_bash/.aliases ~/

echo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "Installing Brew Stuff"
brew install git
brew install python
brew install terraform
brew install awscli
brew install azure-cli
brew tap caskroom/cask
brew cask install google-cloud-sdk

echo "Installing Node Stuff"
brew install node
npm install -g serverless