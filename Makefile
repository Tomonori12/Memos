#Time-stamp: <2017-March-23>

OUTDIR_KERAS = ../keras
#INSDIR_KERAS = ./keras

message:
	echo "specify what you want to do"


#sudo add-apt-repository ppa:graphics-drivers/ppa
basic:
	sudo apt-get update
	sudo apt-get install -y g++
	sudo apt-get install -y git


blacklist:
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


texton:
	sudo grep -l 'quiet splash' /etc/default/grub | sudo xargs sed -i.bak -e 's/quiet splash/quiet text/g'
	sudo update-grub
	sudo systemctl set-default multi-user.target
	sudo reboot

#sudo apt-get install nvidia-378
nvidia-driver:
	wget http://us.download.nvidia.com/XFree86/Linux-x86_64/378.13/NVIDIA-Linux-x86_64-378.13.run
	sudo sh NVIDIA-Linux-x86_64-378.13.run

cuda8.0:
	wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
	sudo sh cuda_8.0.61_375.26_linux-run
	echo ""                                                                     >> ~/.bashrc
	echo ""                                                                     >> ~/.bashrc
	echo ""                                                                     >> ~/.bashrc
	echo "#----------------------------------------------------------"          >> ~/.bashrc
	echo "# Added by Tomonori12 DL-Environment-Autosetup"                       >> ~/.bashrc
	echo "#----------------------------------------------------------"          >> ~/.bashrc
	echo "export PATH=/usr/local/cuda-8.0/bin:\$$PATH"                          >> ~/.bashrc
	echo "export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:\$$LD_LIBRARY_PATH"  >> ~/.bashrc


cuda7.5:
	wget http://developer.download.nvidia.com/compute/cuda/7.5/Prod/local_installers/cuda_7.5.18_linux.run
	sudo sh cuda_7.5.18_linux.run
	echo ""                                                                     >> ~/.bashrc
	echo ""                                                                     >> ~/.bashrc
	echo ""                                                                     >> ~/.bashrc
	echo "#----------------------------------------------------------"          >> ~/.bashrc
	echo "# Added by Tomonori12 DL-Environment-Autosetup"                       >> ~/.bashrc
	echo "#----------------------------------------------------------"          >> ~/.bashrc
	echo "export PATH=/usr/local/cuda-7.5/bin:\$$PATH"                          >> ~/.bashrc
	echo "export LD_LIBRARY_PATH=/usr/local/cuda-7.5/lib64:\$$LD_LIBRARY_PATH"  >> ~/.bashrc


textoff:
	sudo grep -l 'quiet text' /etc/default/grub | sudo xargs sed -i.bak -e 's/quiet text/quiet splash/g'
	sudo update-grub
	sudo systemctl set-default graphical.target
	sudo reboot

cudnn5.1cuda8.0:
	tar xzvf cudnn-8.0-linux-x64-v5.1.tgz 
	sudo cp -a cuda/lib64/* /usr/local/cuda-8.0/lib64/
	sudo cp -a cuda/include/* /usr/local/cuda-8.0/include/
	sudo ldconfig

cudnn6.0cuda8.0:
	tar xzvf cudnn-8.0-linux-x64-v6.0.tgz 
	sudo cp -a cuda/lib64/* /usr/local/cuda-8.0/lib64/
	sudo cp -a cuda/include/* /usr/local/cuda-8.0/include/
	sudo ldconfig

cudnn5.1cuda7.5:
	tar xzvf cudnn-7.5-linux-x64-v5.1.tgz 
	sudo cp -a cuda/lib64/* /usr/local/cuda-8.0/lib64/
	sudo cp -a cuda/include/* /usr/local/cuda-8.0/include/
	sudo ldconftar xzvf cudnn-8.0-linux-x64-v5.1.tgz 

cudnn6.0cuda7.5:
	tar xzvf cudnn-7.5-linux-x64-v6.0.tgz 
	sudo cp -a cuda/lib64/* /usr/local/cuda-8.0/lib64/
	sudo cp -a cuda/include/* /usr/local/cuda-8.0/include/
	sudo ldconfig

anainstall:
	wget https://repo.continuum.io/archive/Anaconda3-4.3.0-Linux-x86_64.sh
	bash ./Anaconda3-4.3.0-Linux-x86_64.sh
	sudo reboot

pip:
	pip install keras
	pip install tensorflow
	pip install tensorflow-gpu

git:
	git clone https://github.com/fchollet/keras $(OUTDIR_KERAS)

mnist_cnn:
	cd $(OUTDIR_KERAS)
	python keras/examples/mnist_cnn.py
