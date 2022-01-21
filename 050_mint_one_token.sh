echo "--------------------------------------------------------------------------------"
echo "mint one token:"

ts-node ./metaplex/js/packages/cli/src/candy-machine-v2-cli.ts mint_one_token \
    -e devnet \
    -k ./.config/solana/devnet.json \
    -c example

echo "--------------------------------------------------------------------------------"
echo "total tokens:"

spl-token accounts
