#SETTING UP THE SECURITY

#generate the router key
ndnsec-key-gen /ndn/upec/%C1.Router/router5 > router5.key

#generate the certificate for the router key
ndnsec-cert-dump -i /ndn/upec/%C1.Router/router5 > router5.cert

#install the router certificate
ndnsec-cert-install -f router5.cert

#to verify that the certificates have been installed
ndnsec-list

#CONFIGURING NFD

#start nfd
nohup nfd-start > /dev/null

#configure each face that a computer uses to connect to a neighboring computer
nfdc face create udp4://192.168.10.1
nfdc face create udp4://192.168.10.2
nfdc face create udp4://192.168.10.3
nfdc face create udp4://192.168.10.4
nfdc face create udp4://192.168.10.254
nfdc face create udp4://192.168.10.6
nfdc face create udp4://192.168.10.7
nfdc face create udp4://192.168.10.8
nfdc face create udp4://192.168.10.9
nfdc face create udp4://192.168.10.10
nfdc face create udp4://192.168.10.11
nfdc face create udp4://192.168.10.12
nfdc face create udp4://192.168.10.13
nfdc face create udp4://192.168.10.14
nfdc face create udp4://192.168.10.15
nfdc face create udp4://192.168.10.16

#SETTING UP THE CONFIGURATION FILE

#move all files in the NLSR directory
mv ~/NLSR/nlsr.conf ~/NLSR/nlsr.conf.backup
mv nlsr.conf ~/NLSR/
mv router5.cert ~/NLSR/
mv router5.key ~/NLSR/
mv start_nlsr.sh ~/NLSR/
