## virtual router
# (neutron) router-create myrouter
curl -g -i --cacert "/home/k5/K5/DigiCertHighAssuranceEVRootCA.pem" -X POST https://networking.uk-1.cloud.global.fujitsu.com/v2.0/routers.json -H "User-Agent: python-neutronclient" -H "Content-Type: application/json" -H "Accept: application/json" -H "X-Auth-Token: {SHA1}3e0e18c508526052e4396563ebe28917753a11be" -d '{"router": {"name": "myrouter", "admin_state_up": true}}'

# (neutron) router-list
curl -g -i --cacert "/home/k5/K5/DigiCertHighAssuranceEVRootCA.pem" -X GET https://networking.uk-1.cloud.global.fujitsu.com/v2.0/routers.json -H "User-Agent: python-neutronclient" -H "Accept: application/json" -H "X-Auth-Token: {SHA1}3e0e18c508526052e4396563ebe28917753a11be"

# (neutron) router-show a85be748-8492-482d-a7b2-bef1ad8e39f5
curl -g -i --cacert "/home/k5/K5/DigiCertHighAssuranceEVRootCA.pem" -X GET https://networking.uk-1.cloud.global.fujitsu.com/v2.0/routers/a85be748-8492-482d-a7b2-bef1ad8e39f5.json -H "User-Agent: python-neutronclient" -H "Accept: application/json" -H "X-Auth-Token: {SHA1}3e0e18c508526052e4396563ebe28917753a11be"


# (neutron) net-list
-> grab external network for AZ (like inf_az2_ext-net01)

# set external gateway ((neutron) router-gateway-set a85be748-8492-482d-a7b2-bef1ad8e39f5 d730db50-0e0c-4790-9972-1f6e2b8c4915)

curl -g -i --cacert "/home/k5/K5/DigiCertHighAssuranceEVRootCA.pem" -X PUT https://networking.uk-1.cloud.global.fujitsu.com/v2.0/routers/a85be748-8492-482d-a7b2-bef1ad8e39f5.json -H "User-Agent: python-neutronclient" -H "Content-Type: application/json" -H "Accept: application/json" -H "X-Auth-Token: {SHA1}3e0e18c508526052e4396563ebe28917753a11be" -d '{"router": {"external_gateway_info": {"network_id": "d730db50-0e0c-4790-9972-1f6e2b8c4915"}}}'


# (neutron) router-interface-add myrouter fcx_subnet-w:subnet_101
curl -g -i --cacert "/home/k5/K5/DigiCertHighAssuranceEVRootCA.pem" -X PUT https://networking.uk-1.cloud.global.fujitsu.com/v2.0/routers/a85be748-8492-482d-a7b2-bef1ad8e39f5/add_router_interface.json -H "User-Agent: python-neutronclient" -H "Content-Type: application/json" -H "Accept: application/json" -H "X-Auth-Token: {SHA1}3e0e18c508526052e4396563ebe28917753a11be" -d '{"subnet_id": "f7f43ff1-2cd1-484d-9ec0-8f4b41feda10"}'


# (neutron) floatingip-associate 90e583b3-f18e-49c5-b072-7d37c73865fd a8140789-7a9e-429e-bb68-947bf34f6b79
curl -g -i --cacert "/home/k5/K5/DigiCertHighAssuranceEVRootCA.pem" -X PUT https://networking.uk-1.cloud.global.fujitsu.com/v2.0/floatingips/90e583b3-f18e-49c5-b072-7d37c73865fd.json -H "User-Agent: python-neutronclient" -H "Content-Type: application/json" -H "Accept: application/json" -H "X-Auth-Token: {SHA1}3e0e18c508526052e4396563ebe28917753a11be" -d '{"floatingip": {"port_id": "a8140789-7a9e-429e-bb68-947bf34f6b79"}}'





## vpn sevice
# (neutron) vpn-service-create --name myvpnservice --description "vpn service connecting k5 and customer site" myrouter fcx_subnet-w:subnet_101
curl -g -i --cacert "/home/k5/K5/DigiCertHighAssuranceEVRootCA.pem" -X POST https://networking.uk-1.cloud.global.fujitsu.com/v2.0/vpn/vpnservices.json -H "User-Agent: python-neutronclient" -H "Content-Type: application/json" -H "Accept: application/json" -H "X-Auth-Token: {SHA1}3e0e18c508526052e4396563ebe28917753a11be" -d '{"vpnservice": {"subnet_id": "f7f43ff1-2cd1-484d-9ec0-8f4b41feda10", "router_id": "a85be748-8492-482d-a7b2-bef1ad8e39f5", "description": "vpn service connecting k5 and customer site", "name": "myvpnservice", "admin_state_up": true}}'

# (neutron) vpn-ikepolicy-create --description "connection policy" --auth-algorithm sha1 --encryption-algorithm aes-256 --phase1-negotiation-mode main --ike-version v1 --pfs group5 --lifetime units=seconds,value=86400 MY-IKE-POLICY
curl -g -i --cacert "/home/k5/K5/DigiCertHighAssuranceEVRootCA.pem" -X POST https://networking.uk-1.cloud.global.fujitsu.com/v2.0/vpn/ikepolicies.json -H "User-Agent: python-neutronclient" -H "Content-Type: application/json" -H "Accept: application/json" -H "X-Auth-Token: {SHA1}3e0e18c508526052e4396563ebe28917753a11be" -d '{"ikepolicy": {"name": "MY-IKE-POLICY", "description": "connection policy", "auth_algorithm": "sha1", "encryption_algorithm": "aes-256", "pfs": "group5", "lifetime": {"units": "seconds", "value": 86400}, "ike_version": "v1", "phase1_negotiation_mode": "main"}}'

# (neutron) vpn-ipsecpolicy-create --description "ipsec policy" --transform-protocol esp --auth-algorithm sha1 --encryption-algorithm aes-256 --encapsulation-mode tunnel --lifetime units=seconds,value=3600 MY-IPSEC-POLICY
curl -g -i --cacert "/home/k5/K5/DigiCertHighAssuranceEVRootCA.pem" -X POST https://networking.uk-1.cloud.global.fujitsu.com/v2.0/vpn/ipsecpolicies.json -H "User-Agent: python-neutronclient" -H "Content-Type: application/json" -H "Accept: application/json" -H "X-Auth-Token: {SHA1}3e0e18c508526052e4396563ebe28917753a11be" -d '{"ipsecpolicy": {"name": "MY-IPSEC-POLICY", "transform_protocol": "esp", "auth_algorithm": "sha1", "encapsulation_mode": "tunnel", "encryption_algorithm": "aes-256", "pfs": "group5", "lifetime": {"units": "seconds", "value": 3600}, "description": "ipsec policy"}}'

# (neutron) ipsec-site-connection-create --name mysiteconnection --description "connection k5 to customer site" --mtu 1350 --vpnservice-id myvpnservice --ikepolicy-id MY-IKE-POLICY --ipsecpolicy-id MY-IPSEC-POLICY --peer-address 188.95.0.105 --peer-id 188.95.0.105 --peer-cidr 10.139.0.0/16 --peer-cidr 188.95.3.0/24 --psk BiFhusbFs73WYmzNHSVq2X6ch26cb7Cf

curl -g -i --cacert "/home/k5/K5/DigiCertHighAssuranceEVRootCA.pem" -X POST https://networking.uk-1.cloud.global.fujitsu.com/v2.0/vpn/ipsec-site-connections.json -H "User-Agent: python-neutronclient" -H "Content-Type: application/json" -H "Accept: application/json" -H "X-Auth-Token: {SHA1}3e0e18c508526052e4396563ebe28917753a11be" -d '{"ipsec_site_connection": {"psk": "BiFhusbFs73WYmzNHSVq2X6ch26cb7Cf", "initiator": "bi-directional", "vpnservice_id": "9db7b938-4dc4-43c7-a21d-6f88f6d04868", "admin_state_up": true, "description": "connection k5 to customer site", "peer_cidrs": ["10.139.0.0/16", "188.95.3.0/24"], "mtu": "1350", "ikepolicy_id": "b1de1775-2074-4347-953f-b5e70d703e04", "ipsecpolicy_id": "a06c652e-ef50-4d21-a872-931330b11a4e", "peer_address": "188.95.0.105", "peer_id": "188.95.0.105", "name": "mysiteconnection"}}'


