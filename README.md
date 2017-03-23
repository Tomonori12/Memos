### Memos
This is brief memos for setup GTX 1080 Ti in Ubuntu 16.04 LST.

###




### CUI


```sudo systemctl set-default multi-user.target```


### GUI

```sudo systemctl set-default graphical.target```


#### install nvidia

```
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-get install nvidia-378
```
