from ubuntu:12.10
maintainer Justin Gallardo <justin.gallardo@gmail.com>

run echo "deb http://archive.ubuntu.com/ubuntu quantal main universe" > /etc/apt/sources.list
run apt-get update
run apt-get upgrade -y

run apt-get install curl wget openssh-server python tmux python-dev git vim supervisor -y

run mkdir -p /var/run/sshd
run mkdir -p /var/log/supervisor
run locale-gen en_US en_US.UTF-8

run curl https://raw.github.com/isaacs/nave/master/nave.sh > /bin/nave && chmod a+x /bin/nave
run nave usemain stable

run curl -L https://www.opscode.com/chef/install.sh | bash

add supervisord.conf /etc/supervisor/conf.d/supervisord.conf

cmd ["/usr/bin/supervisord", "-n"]

expose 22
