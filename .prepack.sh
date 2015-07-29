CHROOT_DIR=/tmp/arm-chroot
# Debian package dependencies for the host
HOST_DEPENDENCIES="debootstrap qemu-user-static binfmt-support sbuild g++-arm-linux-gnueabihf"

sudo apt-get update &> /dev/null
sudo apt-get install -qq -y ${HOST_DEPENDENCIES} &> /dev/null

wget --no-check-certificate https://googledrive.com/host/0B0AeTm15hbhXUksyQXlKaElrcEk -O arm-chroot.tar.bz
sudo tar xjf arm-chroot.tar.bz -C /
sudo chroot ${CHROOT_DIR} bash -c "cd /home/user/arm_buid_try/google-breakpad-read-only && make -j4 check"