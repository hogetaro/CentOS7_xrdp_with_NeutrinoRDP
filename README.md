# CentOS7_xrdp_with_NeutrinoRDP
CentOS7 xrdp with NeutrinoRDP installation script for me

1. Kickstart centos7 dvd with `ks=http://bit.ly/1LSWonX`.(If you want clean instance)
1. `git clone https://github.com/hogetaro/CentOS7_xrdp_with_NeutrinoRDP.git`
1. `sudo bash prereq.sh` installs prerequisits.
1. `sudo bash build.sh` installs xrdp and depending libs to `/usr/local`
