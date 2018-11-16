# glorytun-tcp inside a docker container

### Enable forwarding on the host

```
echo 1 > /proc/sys/net/ipv4/ip_forward
```

### Build

```
docker build -t ysurac/glorytun-tcp:0.0.35 .
```

### Run

#### From the cli

```
docker run -d -e GLORYTUN_KEY=YOUR_KEY -p "5000:5000/udp" --cap-add=NET_ADMIN --device /dev/net/tun --name mud ysurac/glorytun-tcp:0.0.35
```

#### With a docker-compose file

```
cp docker-compose.example.yml docker-compose.yml
docker-compose build
docker-compose up -d
```
