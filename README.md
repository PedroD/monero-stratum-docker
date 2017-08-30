# What is it?

By running `start.sh` (if you have docker installed) you are automatically creating a Monero Stratum pool in your local machine.

You can then connect any miner you like to this pool by connecting to localhost:3333 (or remote_ip:3333 if your miner is on another computer).

Just remember to edit the `configs.json` with your wallet's address and upstream address.

The upstream address is where the pool gets the blockchain and its real-time updates (to read and submit new blocks).

In practice this means you need to have `monerod` (monero daemon) running somewhere (in the local machine where the pool is running for eg.).

Other alternative is to download monero-wallet-gui and start the daemon there.

If it is your first time you'll have to download the entire blockchain (it will take hours), or you can just download it from [here](https://downloads.getmonero.org/blockchain.raw) and then import it to your wallet using `monero-blockchain-import --verify 0 --input-file ./blockchain.raw`.

`monero-blockchain-import` should be within the folder of monero-wallet-gui or your [monero](https://github.com/monero-project/monero.git) installation (check the Dockerfile of this project to see how monero is installed).

Enjoy your solo mining!
