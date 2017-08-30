# What is it?

By running `start.sh` (if you have docker installed) you are automatically creating a [Monero Stratum pool](https://github.com/sammy007/monero-stratum.git) in your local machine.

You can then connect any miner you like to this pool by connecting to localhost:3333 (or remote_ip:3333 if your miner is on another computer).

Just remember to edit the `configs.json` with your wallet's address and upstream address.

The upstream address is where the pool gets the blockchain and its real-time updates (to read and submit new blocks).

In practice this means you need to have `monerod` (monero daemon) running somewhere (in the local machine where the pool is running for eg.).

Other alternative is to download monero-wallet-gui and start the daemon there.

If it is your first time you'll have to download the entire blockchain (it will take hours), or you can just download it from [here](https://downloads.getmonero.org/blockchain.raw) and then import it to your wallet app using `monero-blockchain-import --verify 0 --input-file ./blockchain.raw`.

`monero-blockchain-import` should be within the folder of monero-wallet-gui or your [monero](https://github.com/monero-project/monero.git) installation (check the Dockerfile of this project to see how monero is installed).

## The noob way

So, in sum if you are a beginner:

1. Install monero-wallet-gui.
2. Download the blockchain and use the `monero-blockchain-import` command as I stated above, or just leave the wallet synchronizing for about half a day.
3. Change the address in the `config.json` file to your wallet receive address (or leave mine there if you are feeling generous :) ).
4. Run `sh start.sh` and wait some minutes until you start seeing logs like `2017/08/29 23:56:51 Loading config: /monero-stratum/config.json`.
5. Configure any miner of your choice (eg. xmr-stak-nvidia, ccminer, etc) and configure it to use this stratum, for eg. my miner was configured this way: `ccminer -o stratum+tcp://192.168.0.108:3333 -u 45Dizd9V5VvanN7YmJcNo6ddp8pcyuxFgFkL9zipWRnTfZJeQ5F4PFN7Dn9b5GkJnMiVQ1PVG8DyTfmjouLFBWtp5HYjs9w`, where `192.168.0.108` is the IP of the machine running this docker container, which could be `localhost`.
6. You can also activate the solo mining option in the Advanced tab on your monero-wallet-gui.
7. Take a look at http://localhost:8082/ in the machine where you're running the container.
8. Enjoy your solo mining!

**Note:** You can add more miners, if you are able to host this online you can create your own online private pool!

# Reserve a place in Heaven

### Donation Monero address:
45Dizd9V5VvanN7YmJcNo6ddp8pcyuxFgFkL9zipWRnTfZJeQ5F4PFN7Dn9b5GkJnMiVQ1PVG8DyTfmjouLFBWtp5HYjs9w

### Donation Bitcoin address:
1K76eEG1gC7S2aehVbrqpdcNysrNhuC9V7
