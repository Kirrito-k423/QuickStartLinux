# vpn Jump
## openvpn
```
apt install openvpn
cd /etc/openvpn
cd client/
cp ~/iscst11@vpn.nscc.sg.ovpn .
```
openvpn --daemon --cd /etc/openvpn/client --config iscst11@vpn.nscc.sg.ovpn --log-append /var/log/openvpn.log