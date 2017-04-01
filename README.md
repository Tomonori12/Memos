### Memos
This repository includes this readme and a Makefile.  The Makefile allows you to easily setup a deep learning platform using keras, tensorflow and theano.  The testing OS is **Ubuntu 16.04 LST 64bit**, and hardware environmnets are X79 Extream 9 with Core i7, 32Gb memory and **GTX 1080 Ti**.  All processes can be done just to follow as below.

### 1. Make a directory to keep the Makefile and download the Makefile from this repository.  Let's assume that we keep it in "DL_folder" under your user accuount folder.

  - This Makefile uses a relative path.  So, YOU MAST KEEP THE MAKEFILE IN A FOLDER JUST UNDER YOUR USER ACCOUNT. 

### 2. Open terminal and move to "DL_folder". (E.g. ```cd ./DL_folder```)

### 3. Type ```sudo make basic``` in terminal.
  - ~~This step adds a repository for the nvidia drivers.~~
  - Also this will get g++ and git libraries installed on your machine.  If you already have those ones, instalations will be skipped.

### 4. Type ```sudo make blacklist``` in termianl.

  - This will stop nouveau display driver, which is an open source display driver, but not originally from nvidia.
  
### 5. Type ```sudo make texton``` in terminal.

  - This will force you to reboot as CUI mode to install a nvidia original display driver.
  
### 6. Now you're in CUI, right?  Try to login your account.

  - Only text massage will appear on the screen.
  
### 7. Install the nvidia driver for 1080Ti ```make nvidia-diriver```.

  - Follow the instration screen.  Select ```Yes``` for X Window activation.
  
### 8. Move to "DL_folder" and type ```make cuda8.0 (or cuda7.5)``` in CUI.

  - It will take sometime to download and install cuda.  Cuda is about 1.4Gb, so be patient.
  - While instalation **DON'T INSTALL NVIDIA DRIVER!!!** The driver has already installed in step 7.
  - To install cuda, you need to follow the screen guides and basically type in as below:
    -   accept > **n** > y > y > y > ```Enter``` > y > y > ```Enter```

### 9. Type ```sudo make textoff``` to return GUI.

  - Now the computer starts rebooting.
  
### 10. Open terminal and move to "DL_folder" again.

### 11. Type ```make cudnn5.1cuda8.0 (or cudnn5.1cuda7.5)``` in terminal.

  - This will install cuDNN library.
  - Select appropriate version for your cuda. 
     - cudnn5.1cuda8.0 for cuda8.0
     - cudnn5.1cuda7.5 for cuda7.5

### 13. Type ```make anainstall``` in terminal

  - This step is to download and install Anaconda.  Anaconda is ~500Mb.
  - To install anaconda, you need to follow guides.
    - ```Enter``` >  ```yes``` > ```Enter``` > ```yes```
  - If you don't mind, better select ```yes``` to set a path to Anaconda's python.

### 14. Type ```make pip``` in terminal.

  - Now you install all required packages for deep learning.

### 15. Type ```make git``` in terminal.

  - Now you can test your platform. (E.g. ```python ../keras/example/mnist_cnn.py```)


*This document and links in the document are confirmed on 22nd March 2017.*

- Software versions used in this process
  - "cuDNN v5.1 Runtime Library for Ubuntu 14.04 (Deb)"
  - "Nvidia-378 driver"
  - "cuda_8.0.61_375.26_linux.run"
  - "Anaconda3-4.3.0-Linux-x86_64.sh"

