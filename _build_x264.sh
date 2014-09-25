function build_x264 {
  echo "Building x264 for android ..."

  test -d ${src_root}/x264 || \
    git clone git://git.videolan.org/x264.git ${src_root}/x264 >> ${build_log} 2>&1 || \
    die "Couldn't clone x264 repository!"

  cd ${src_root}/x264

  ./configure --cross-prefix=${TOOLCHAIN}/bin/arm-linux-androideabi- --sysroot=${SYSROOT} --host=arm-linux --enable-pic --enable-static --disable-cli --prefix=$dist_root >> ${build_log} 2>&1 || die "Couldn't configure x264!"

  # build
  make >> ${build_log} 2>&1 || die "Couldn't build x264!"
  make install >> ${build_log} 2>&1 || die "Couldn't install x264!"

  cd ${top_root}
}
