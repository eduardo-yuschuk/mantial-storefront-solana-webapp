echo "--------------------------------------------------------------------------------"
echo "mint multiple tokens (2):"

ts-node ./metaplex/js/packages/cli/src/candy-machine-v2-cli.ts mint_multiple_tokens \
    -e devnet \
    -k ./.config/solana/devnet.json \
    -c example \
    --number 2

echo "--------------------------------------------------------------------------------"
echo "total tokens:"

spl-token accounts
