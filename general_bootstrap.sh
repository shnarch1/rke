sudo apt-get update
sudo apt-get install docker.io -y
sudo usermod  -G docker vagrant
echo -e "qwe123\nqwe123" | passwd root
sudo cat /home/avi/Documents/rke/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
sudo cat /home/avi/Documents/rke/id_rsa.pub >> /root/.ssh/authorized_keys


