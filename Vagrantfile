# -*- mode: ruby -*-
# vi: set ft=ruby :
#author: TonyFeng

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

		config.vm.define "docker" do |node|
	
		# 设置虚拟机的Box
		node.vm.box = "centos/7"
		# 设置虚拟机的主机名
		node.vm.hostname="docker"
		# 设置虚拟机本地(即宿主机)使用的IP
		node.vm.network "private_network", ip: "192.168.33.11"

		
		# hadoop HDFS NameNode web管理端口
		node.vm.network "forwarded_port", guest: 3306, host: 33060, protocol: "tcp", id: "mysql"
		
		# 宿主机与虚拟机22端口转发映
		# config.vm.network "forwarded_port", guest: 22, host: "220#{i}"
		node.vm.network "forwarded_port", guest: 22, host: "2211"

		# 设置宿主机与虚拟机的共享目录 (默认当前目录会挂载到虚机主用户目录下/home/vagrant)
		#node.vm.synced_folder "~/Desktop/share", "/home/vagrant/share"

		# 拷贝相应的依赖文件
		config.vm.provision "file", source: "sshd_config", destination: "/home/vagrant/sshd_config"
		config.vm.provision "file", source: "yum", destination: "/home/vagrant/yum"
		config.vm.provision "file", source: "my.cnf", destination: "/home/vagrant/my.cnf"

		# VirtaulBox相关配置
		node.vm.provider "virtualbox" do |v|
			# 设置虚拟机的名称
			v.name = "docker"
			# 设置虚拟机的内存大小  
			v.memory = 1024
			# 设置虚拟机的CPU个数
			v.cpus = 1
		end

		# node.vm.provision "shell", inline: $clusters_script # 使用shell脚本进行软件安装和配置
		# 配置jdk hadoop flink大数据开发环境变量
		node.vm.provision "shell", path: "scripts/cluster-env.sh" 
		# 更换国内yum源
		node.vm.provision "shell", path: "scripts/replace-yum-repo.sh" 
		# 同步集群时间
		node.vm.provision "shell", path: "scripts/sync-time.sh" 
		# adduser usergroup sudoers
		node.vm.provision "shell", path: "scripts/add-user.sh" 
		# todo:  auto login without password 
		# node.vm.provision "shell", path: "scripts/ssh-group.sh" 

		config.vm.provision "shell", inline: <<-SHELL
	
#---ssh---
yum install -y wget curl conntrack-tools vim net-tools socat ntp kmod ceph-common dos2unix
		
echo 'disable selinux'
setenforce 0
sed -i 's/=enforcing/=disabled/g' /etc/selinux/config

echo 'enable iptable kernel parameter'
cat >> /etc/sysctl.conf <<EOF
net.ipv4.ip_forward=1
EOF
sysctl -p

cat /etc/hosts

		echo 'set nameserver'
	echo "nameserver 8.8.8.8">/etc/resolv.conf
	cat /etc/resolv.conf

		echo 'disable swap'
		swapoff -a
		sed -i '/swap/s/^/#/' /etc/fstab

		#create group if not exists
		egrep "^docker" /etc/group >& /dev/null
		if [ $? -ne 0 ]
		then
		groupadd docker
		fi

		usermod -aG docker vagrant
		rm -rf ~/.docker/
		yum install -y docker.x86_64

cat > /etc/docker/daemon.json <<EOF
{
"registry-mirrors" : ["http://2595fda0.m.daocloud.io"]
}
EOF

echo 'enable docker'
systemctl daemon-reload
systemctl enable docker
systemctl start docker
SHELL

		end
end
