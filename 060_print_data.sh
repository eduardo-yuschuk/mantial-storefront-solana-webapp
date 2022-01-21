echo "--------------------------------------------------------------------------------"
echo "show mint addresses:"

ts-node ./metaplex/js/packages/cli/src/candy-machine-v2-cli.ts get_all_mint_addresses \
    -e devnet \
    -k ./.config/solana/devnet.json \
    -cp ./config.json \
    -c example

echo "--------------------------------------------------------------------------------"
echo "show candy machine data:"

ts-node ./metaplex/js/packages/cli/src/candy-machine-v2-cli.ts show \
    -e devnet \
    -k ./.config/solana/devnet.json \
    -cp ./config.json \
    -c example
