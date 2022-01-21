echo "--------------------------------------------------------------------------------"
echo "explore the candy machine:"

CM_ADDRESS=$(ts-node ./metaplex/js/packages/cli/src/candy-machine-v2-cli.ts show -e devnet -k ./.config/solana/devnet.json -cp ./config.json -c example | grep Key | )
echo https://explorer.solana.com/address/$CM_ADDRESS?cluster=devnet

echo "--------------------------------------------------------------------------------"
echo "explore the minted tokens:"

echo [https://explorer.solana.com/address/$(solana address)/tokens?cluster=devnet]
