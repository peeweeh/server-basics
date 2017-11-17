echo "Developer Upgrade"
echo "Installing Bash Profiles"
cp -r ../general/super_bash/.bash_profile ~/
cp -r ../general/super_bash/.bash_prompt ~/
cp -r ../general/super_bash/.aliases ~/

echo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing Brew Stuff"
brew upgrade git
brew upgrade python
brew upgrade terraform
brew upgrade awscli
brew upgrade azure-cli
brew tap caskroom/cask
brew cask upgrade google-cloud-sdk

echo "Installing Node Stuff"
brew upgrade node
npm upgrade -g serverless