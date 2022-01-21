echo "--------------------------------------------------------------------------------"
echo "installing prerequisites:"

if ! command -v git &>/dev/null; then
    echo "git could not be found"
    apt install git
fi
if ! command -v node &>/dev/null; then
    echo "node could not be found"
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
    apt-get install -y nodejs
fi
if ! command -v yarn &>/dev/null; then
    echo "yarn could not be found"
    npm install --global yarn
fi
if ! [ -x "$(command -v ts-node)" ]; then
    echo 'Error: ts-node is not installed.' >&2
    npm install -g typescript
    npm install -g ts-node
fi
if ! [ -x "$(command -v solana)" ]; then
    echo 'Error: solana is not installed.' >&2
    sh -c "$(curl -sSfL https://release.solana.com/stable/install)"
    source ~/.profile
fi

echo "--------------------------------------------------------------------------------"
echo "installed versions:"

git version
echo "node version: $(node --version)"
echo "yarn version: $(yarn --version)"
echo "ts-node version: $(ts-node --version)"
solana --version

echo "--------------------------------------------------------------------------------"
echo "cloning and building metaplex:"

rm -rf ./metaplex
git clone -b v1.1.1 https://github.com/metaplex-foundation/metaplex.git
yarn install --cwd ./metaplex/js/
ts-node ./metaplex/js/packages/cli/src/candy-machine-v2-cli.ts --version
