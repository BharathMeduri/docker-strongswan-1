build:
	docker build -t choffmeister/strongswan:latest .

init: build
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
