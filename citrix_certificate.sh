CERT_FILE="/home/$USER/Downloads/digicert_global_root_g2.pem"

sudo cp $CERT_FILE /opt/Citrix/ICAClient/keystore/cacerts
sudo /opt/Citrix/ICAClient/util/ctx_rehash
