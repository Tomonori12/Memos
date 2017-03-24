### Memos
This repository includes this readme and a Makefile.  The Makefile allows you to easily setup a deep learning platform using keras, tensorflow and theano.  The testing OS is **Ubuntu 16.04 LST 64bit**, and hardware environmnets are X79 Extream 9 with Core i7, 32Gb memory and **GTX 1080 Ti**.  All processes can be done just to follow as below.

### 1. Make a directory to keep the Makefile and download the Makefile from this repository.  Let's assume that we keep it in "DL_folder" under your user accuount folder.

  - This Makefile uses a relative path.  So, YOU MAST KEEP THE MAKEFILE IN A FOLDER JUST UNDER YOUR USER ACCOUNT. 

### 2. Open terminal and move to "DL_folder". (E.g. ```cd ./DL_folder```)

### 3. Type ```sudo make 1basic``` in terminal.
  - ~~This step adds a repository for the nvidia drivers.~~
  - Also this will get g++ and git libraries installed on your machine.  If you already have those ones, instalations will be skipped.

### 4. Type ```sudo make 2blacklist``` in termianl.

  - This will stop nouveau display driver, which is an open source display driver, but not originally from nvidia.
  
### 5. Type ```sudo make 3texton``` in terminal.

  - This will force you to reboot as CUI mode to install a nvidia original display driver.
  
### 6. Now you're in CUI, right?  Try to login your account.

  - Only text massage will appear on the screen.

### 7. Move to "DL_folder" and type ```make 4cudainstall``` in CUI.

  - It will take sometime to download and install cuda.  Cuda is about 1.4Gb, so be patient.
  - *Just before the instalation process starts, you need to type in your superuser password.*
  - Nvidia-378 driver will be used for 1080 Ti.
  - To install cuda, you need to follow the screen guides and basically type in as below:
    -   accept > **n** > y > y > y > ```Enter``` > y > y > ```Enter```

### 8. Type ```sudo make 5cudaecho``` soon after you install cuda.

  - This is to configure a path for cuda. 
  
### 9. Type ```sudo make 6textoff``` to return GUI.

  - Now the computer starts rebooting.
  
### 10. Open terminal and move to "DL_folder" again.

### 11. Type ```sudo make 7cudnn``` in terminal.

  - This will install cuDNN library.

### 12. Type ```make 8anainstall``` in terminal

  - This step is to download and install Anaconda.  Anaconda is ~500Mb.
  - To install anaconda, you need to follow guides.
    - ```Enter``` >  ```yes``` > ```Enter``` > ```yes```
  - If you don't mind, better select ```yes``` to set a path to Anaconda's python.

### 13. Type ```make 9pip``` in terminal.

  - Now you install all required packages for deep learning.

### 14. Type ```make 10git``` in terminal.

  - Now you can test your platform. (E.g. ```python ../keras/example/mnist_cnn.py```)


*This document and links in the document are confirmed on 22nd March 2017.*

- Software versions used in this process
  - "cuDNN v5.1 Runtime Library for Ubuntu 14.04 (Deb)"
  - "Nvidia-378 driver"
  - "cuda_8.0.61_375.26_linux.run"
  - "Anaconda3-4.3.0-Linux-x86_64.sh"

