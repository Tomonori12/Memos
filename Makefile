#Time-stamp: <2017-March-23>

OUTDIR_KERAS = ../keras
#INSDIR_KERAS = ./keras

0message:
	echo "specify what you want to do"


1basic:
	sudo add-apt-repository ppa:graphics-drivers/ppa
	sudo apt-get update
	sudo apt-get install -y g++
	sudo apt-get install -y git


2blacklist:
	echo ""                           > test.txt
	echo "blacklist nouveau"          >> test.txt
	echo "blacklist lbm-nouveau"      >> test.txt
	echo "options nouveau modeset=0"  >> test.txt
	echo "alias nouveau off"          >> test.txt
	echo "alias lbm-nouveau off"      >> test.txt
	sudo mv test.txt /etc/modprobe.d/blacklist-nouveau.conf
	echo ""                           > test2.txt
	echo "options nouveau modeset=0"  >> test2.txt
	sudo mv test2.txt /etc/modprobe.d/nouveau-kms.conf
	sudo update-initramfs -u


3texton:
	sudo systemctl set-default multi-user.target
	sudo reboot
	

4cudainstall:
	wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
	sudo apt-get install nvidia-378
	sudo sh cuda_8.0.61_375.26_linux-run


5cudaecho:
	echo ""                                                                     >> ~/.bashrc
	echo ""                                                                     >> ~/.bashrc
	echo "#Added by Tomonori12 DL-Environment-Autosetup"                         >> ~/.bashrc
	echo "export PATH=/usr/local/cuda-8.0/bin:\$$PATH"                          >> ~/.bashrc
	echo "export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:$$LD_LIBRARY_PATH"   >> ~/.bashrc


6textoff:
	sudo systemctl set-default graphical.target	
	sudo reboot


7cudnn:
	wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1404/x86_64/libcudnn5_5.1.10-1+cuda8.0_amd64.deb
	sudo dpkg -i libcudnn5_5.1.10-1+cuda8.0_amd64.deb


8anainstall:
	wget https://repo.continuum.io/archive/Anaconda3-4.3.0-Linux-x86_64.sh
	bash ./Anaconda3-4.3.0-Linux-x86_64.sh
	# source ~/.bashrc
	sudo reboot

9pip:
	pip install keras
	pip install tensorflow
	pip install tensorflow-gpu
	pip install theano

10git:
	git clone https://github.com/fchollet/keras $(OUTDIR_KERAS)
