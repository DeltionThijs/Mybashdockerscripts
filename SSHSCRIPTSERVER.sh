#!/bin/bash

sudo -u thijs ssh-keygen

# Save the private key, /home/thijs/.ssh/id_rsa, to your computer.
cp /home/thijs/.ssh/id_rsa ~/Documents
# Delete the private key from your instance.
rm /home/thijs/.ssh/id_rsa
Rename the public key to authorized_keys
mv /home/thijs/.ssh/id_rsa.pub /home/thijs/.ssh/authorized_keys

#ssh -i ~/.ssh/thijs_id_rsa thijs@192.168.122.158
