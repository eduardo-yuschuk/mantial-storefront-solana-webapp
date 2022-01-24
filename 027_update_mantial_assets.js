'use strict';
const { strictEqual } = require('assert');
const fs = require('fs');
var path = require('path');

let assetsMaxCount = 10;

// reads deployer address from configuration
let text = fs.readFileSync('./config.json', 'utf8');
fs.writeFileSync('./config.json', text, 'utf8');
let config = JSON.parse(fs.readFileSync('./config.json', 'utf8').toString());
let solTreasuryAccount = config.solTreasuryAccount;
console.log(solTreasuryAccount);

function getDestinationAssetNumber(filepath) {
    let parts = filepath.split('/');
    let nameAndExtension = parts[parts.length - 1];
    let name = nameAndExtension.split('.')[0];
    let assetNumber = parseInt(name);
    let destinationAssetNumber = assetNumber - 1;
    return destinationAssetNumber;
}

function updateJsonData(asset, destinationAssetNumber, solTreasuryAccount) {
    asset.image = destinationAssetNumber.toString() + '.png';
    asset.symbol = "OMG";
    asset.properties = {
        "creators": [
            {
                "address": "5vgrqLci7wBdd5dEn1VpZZbxByWG6HoL8ygRUjCTJ7ea",
                "share": 50
            },
            {
                "address": solTreasuryAccount,
                "share": 50
            }
        ],
        "files": [
            {
                //'https://mantial-collections-production.s3.amazonaws.com/0xa8b02283bc81dabf8bf3fcebef7b6af167894231/img/' + 
                "uri": destinationAssetNumber.toString() + '.png',
                "type": "image/png"
            }
        ]
    };
    asset.collection = {
        "name": "Oh My Giraffe! Baby collection",
        "family": "Oh My Giraffe!"
    };
}

// assets json update
let jsonFolder = './json';
fs.readdir(jsonFolder, function (err, files) {
    if (err) {
        console.error("Could not list the directory.", err);
        process.exit(1);
    }
    files.forEach(function (file, index) {
        var filepath = path.join(jsonFolder, file);
        fs.readFile(filepath, (err, data) => {
            if (err) throw err;
            let asset = JSON.parse(data);
            let destinationAssetNumber = getDestinationAssetNumber(filepath);
            if(destinationAssetNumber < assetsMaxCount) {
                console.log(asset.name);
                updateJsonData(asset, destinationAssetNumber, solTreasuryAccount);
                let result = JSON.stringify(asset, null, 2);
                let destinationFullPath = './assets/' + destinationAssetNumber.toString() + '.json';
                //console.log(destinationFullPath);
                fs.writeFileSync(destinationFullPath, result);
            }
        });
    });
});

// image files copy (renumbered)
let imageFolder = './images';
fs.readdir(imageFolder, function (err, files) {
    if (err) {
        console.error("Could not list the directory.", err);
        process.exit(1);
    }
    files.forEach(function (file, index) {
        var filepath = path.join(imageFolder, file);
        let destinationAssetNumber = getDestinationAssetNumber(filepath);
        if(destinationAssetNumber < assetsMaxCount) {
            let destinationFullPath = './assets/' + destinationAssetNumber.toString() + '.png';
            console.log("Copying " + file + " to " + destinationFullPath);
            fs.copyFileSync(filepath, destinationFullPath);
        }
    });
});
