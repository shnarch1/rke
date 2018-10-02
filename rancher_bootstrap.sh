wget https://github.com/rancher/rke/releases/download/v0.1.9/rke_linux-amd64
sudo chmod  +x rke_linux-amd64
cp /home/avi/Documents/rke/id_rsa /home/vagrant/.ssh/
cp /home/avi/Documents/rke/id_rsa /root/.ssh/
sudo chown -R vagrant:vagrant /home/vagrant/.ssh/

#sudo echo -e "\n" | ssh-keygen -t rsa -N "" -n vagrant,root
#sudo ssh-copy-id vagrant@10.100.1.102
#sudo ssh-copy-id vagrant@10.100.1.103
#sudo ssh-copy-id vagrant@10.100.1.104


