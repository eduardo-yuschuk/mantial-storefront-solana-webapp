echo "--------------------------------------------------------------------------------"
echo "creating demo assets:"

curl https://docs.metaplex.com/assets/files/assets-934a7281da49092b2a477733d067d8a0.zip --output ./assets.zip
unzip ./assets.zip
rm -f ./assets.zip
for json_file in ./assets/*.json;
do
  address=$(solana address)
  sed -i "s/6j4nNrozTJkk1zatiXHezSLZArnRUq3WkGKHACThXGpZ/$address/g" $json_file 
done
