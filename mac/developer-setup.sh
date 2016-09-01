echo "installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "Installing Bash Profiles"
cd ~
curl -O https://raw.githubusercontent.com/nicolashery/mac-dev-setup/master/.bash_profile
curl -O https://raw.githubusercontent.com/nicolashery/mac-dev-setup/master/.bash_prompt
curl -O https://raw.githubusercontent.com/nicolashery/mac-dev-setup/master/.aliases
brew install git
brew install python
pip install --upgrade distribute
pip install --upgrade pip
brew install node
PATH=/usr/local/share/npm/bin:$PATH
sudo xcode-select -switch /usr/bin
sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
echo "Installing JSHINT"
npm install -g jshint

echo "Installing Software"
curl -s http://www.getmacapps.com/raw/xqq5hwxhgrl | sh