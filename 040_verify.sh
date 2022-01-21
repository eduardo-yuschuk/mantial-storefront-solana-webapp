echo "--------------------------------------------------------------------------------"
echo "verify upload:"

ts-node ./metaplex/js/packages/cli/src/candy-machine-v2-cli.ts verify_upload \
    -e devnet \
    -k ./.config/solana/devnet.json \
    -c example
