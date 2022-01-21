echo "--------------------------------------------------------------------------------"
echo "upload:"

ts-node ./metaplex/js/packages/cli/src/candy-machine-v2-cli.ts upload \
    -e devnet \
    -k ./.config/solana/devnet.json \
    -cp ./config.json \
    -c example \
    ./assets
