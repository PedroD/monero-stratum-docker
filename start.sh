docker build -t monero_stratum .
docker run -p 3333:3333 -p 1111:1111 -p 8082:8082 --add-host="localhost:192.168.65.1" monero_stratum
