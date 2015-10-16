# for yasm
if [ ! -f yasm.tgz ]; then
  curl http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz >yasm.tgz
fi
if [ ! -f /usr/local/bin/yasm ]; then
  rm -rf yasm-*
  tar zxvf yasm.tgz
  cd yasm-*
  ./configure
  make install
  cd ..
fi

# for ffmpeg
export PATH="/usr/local/bin:$PATH"
if [ ! -f ffmpeg.tbz ]; then
  # git clone git://source.ffmpeg.org/ffmpeg.git ffmpeg
  curl https://www.ffmpeg.org/releases/ffmpeg-1.2.12.tar.bz2 >ffmpeg.tbz
  # curl https://www.ffmpeg.org/releases/ffmpeg-2.0.7.tar.bz2 >ffmpeg.tbz
fi
if [ ! -f /usr/local/lib/libavcodec.a ]; then
  rm -rf ffmpeg-*
  bzip2 -cd ffmpeg.tbz|tar xvf -
  cd ffmpeg-*
  ./configure --extra-cflags=-fPIC --enable-pic --enable-gpl --enable-nonfree --enable-shared
  # ./configure --enable-pic --enable-gpl --enable-nonfree
  make install
  cd ..
fi

# for NeutrinoRDP
if [ ! -d NeutrinoRDP ]; then
  git clone https://github.com/neutrinolabs/NeutrinoRDP.git
fi
if [ ! -f /usr/local/lib/libfreerdp-cache.so.1.0.1 ]; then
  cd NeutrinoRDP
  git checkout -- .
  patch -p1 < ../nrdp.diff
  cmake -DWITH_SSE2=ON
  make install
  cd ..
fi

# for xrdp
if [ ! -d xrdp ]; then
  git clone git://github.com/neutrinolabs/xrdp.git
fi

if [ 1 = 1 ]; then
  cd xrdp
  export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
  git checkout -- .
  ./bootstrap
  ./configure --enable-neutrinordp
  make install
  cd ..
fi

cat xrdp-ini.diff| (cd /etc;patch -p2 ) 

