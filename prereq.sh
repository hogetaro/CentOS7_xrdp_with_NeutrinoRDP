# For xrdp
yum install -y finger cmake patch gcc make autoconf libtool automake pkgconfig openssl-devel gettext file pam-devel libX11-devel libXfixes-devel libjpeg-devel flex bison gcc-c++ libxslt perl-libxml-perl xorg-x11-font-utils xmlto-tex libXrandr-devel 


# For NeutorinoRDP
yum install -y gcc cmake openssl-devel libX11-devel libXext-devel libXinerama-devel libXcursor-devel \
  libXi-devel libXdamage-devel libXv-devel libxkbfile-devel alsa-lib-devel cups-devel ffmpeg-devel glib2-devel

# For ffmpeg
yum install -y yasm 
