CHROOT_DIR=/tmp/arm-chroot
# Debian package dependencies for the host
HOST_DEPENDENCIES="debootstrap qemu-user-static binfmt-support sbuild g++-arm-linux-gnueabihf"
GUEST_DEPENDENCIES="build-essential git m4 sudo python subversion"

sudo apt-get update &> /dev/null
sudo apt-get install -qq -y ${HOST_DEPENDENCIES} &> /dev/null

wget --no-check-certificate https://googledrive.com/host/0B0AeTm15hbhXUksyQXlKaElrcEk -O arm-chroot.tar.bz
sudo tar xjf arm-chroot.tar.bz -C /
sudo chroot ${CHROOT_DIR} bash -c "uname -a"
sudo chroot ${CHROOT_DIR} bash -c "g++ --version"
#sudo chroot ${CHROOT_DIR} apt-get update
#sudo chroot ${CHROOT_DIR} apt-get --allow-unauthenticated install \
#    -qq -y ${GUEST_DEPENDENCIES}
#sudo chroot ${CHROOT_DIR} bash -c "cd /home/user/arm_buid_try/google-breakpad-read-only && svn up"
sudo chroot ${CHROOT_DIR} bash -c "cd /home/user/arm_buid_try/google-breakpad-read-only && ./configure && make -j4 check VERBOSE=1
