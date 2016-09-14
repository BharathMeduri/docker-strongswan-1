# docker-strongswan

```bash
docker pull choffmeister/strongswan:latest

docker run -it --rm \
  -v "${PWD}/data:/data" \
  -e VPN_DOMAIN=vpn.domain.com \
  -e VPN_SUBNET=10.0.0.0/24 \
  -e VPN_DNS=8.8.8.8 \
  -e VPN_PSK=presharedkey \
  -e VPN_USERNAME=username \
  -e VPN_PASSWORD=password \
  -e VPN_P12_PASSWORD=p12password \
  choffmeister/strongswan:latest \
  init

docker run -d \
  --privileged=true \
  --cap-add=NET_ADMIN \
  --restart always \
  -p 500:500/udp \
  -p 4500:4500/udp \
  -e VPN_SUBNET=10.0.0.0/24 \
  -v "/lib/modules:/lib/modules:ro" \
  -v "${PWD}/data/ipsec.conf:/etc/ipsec.conf:ro" \
  -v "${PWD}/data/ipsec.d:/etc/ipsec.d:ro" \
  -v "${PWD}/data/ipsec.secrets:/etc/ipsec.secrets:ro" \
  -v "${PWD}/data/strongswan.conf:/etc/strongswan.conf:ro" \
  -v "${PWD}/data/strongswan.d:/etc/strongswan.d:ro" \
  -v "/etc/localtime:/etc/localtime:ro" \
  choffmeister/strongswan:latest
```

## Credits

Originally based on [houselabs/strongswan](https://github.com/houselabs/docker-strongswan).
