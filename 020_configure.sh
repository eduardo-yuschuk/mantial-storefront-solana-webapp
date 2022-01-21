echo "--------------------------------------------------------------------------------"
echo "configuring wallet and net:"

solana-keygen new --force --no-bip39-passphrase --outfile ./.config/solana/devnet.json
solana config set --keypair ./.config/solana/devnet.json
solana config set --url https://api.devnet.solana.com
solana airdrop 2
solana config get
solana address

echo "--------------------------------------------------------------------------------"
echo "configuring candy machine:"

cat > ./config.json << EOL
{
    "price": 1.0,
    "number": 10,
    "gatekeeper": null,
    "solTreasuryAccount": "<YOUR WALLET ADDRESS>",
    "splTokenAccount": null,
    "splToken": null,
    "goLiveDate": "25 Dec 2021 00:00:00 GMT",
    "endSettings": null,
    "whitelistMintSettings": null,
    "hiddenSettings": null,
    "storage": "arweave-sol",
    "ipfsInfuraProjectId": null,
    "ipfsInfuraSecret": null,
    "awsS3Bucket": null,
    "noRetainAuthority": false,
    "noMutable": false
}
EOL

sed -i "s/<YOUR WALLET ADDRESS>/$(solana address)/g" ./config.json
sed -i "s/arweave-sol/arweave/g" ./config.json