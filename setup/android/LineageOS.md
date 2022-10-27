## What you’ll need?
- Your Device
- Linux (x64), and using Ubuntu 20.04 LTS. 
- A reasonable amount of RAM, 16GB and up were recommended.
- A reasonable amount of Storage, at least 200GB, the bigger---the better, as you may use some storage as ccache to speed up the process.
- Some familiarity with basic Android operation, and in Linux command.

## Platform Tools
- Download this [SDK-Platform-Tools](https://dl.google.com/android/repository/platform-tools-latest-linux.zip).
- And run: `unzip platform-tools-latest-linux.zip -d ~`
- Setup the PATH, usually it is automatic, but no harm in doing so:
```
if [ -d "$HOME/platform-tools" ] ; then
    PATH="$HOME/platform-tools:$PATH"
fi
```
- Then run: `source ~/.profile`

## Build Environment Package
- Run this scripts:
```
git clone https://github.com/cd-Spidey/Random ./buildenv
sudo bash build_env.sh
sudo bash open_jdk.sh
```

## Compile Process
- Create your Base Directory
```
mkdir -p ~/android/lineage
```
- Configure your Git Identiy
```
cd ~android
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```
- Set CCache to Speed up Proccess
```
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
ccache -M 50G
```
- Initialize Repo
```
cd ~/android/lineage
repo init -u https://github.com/LineageOS/android.git -b lineage-19.1
repo sync
```
- Prepare Device Tree
```
cd ~/android/lineage
git clone https://github.com/xiaomi-mt6853-devs/android_device_xiaomi_cannon.git -b lineage-19.1 ./device/xiaomi/cannon
```
- Prepare Vendor Tree
```
cd ~/android/lineage
git clone https://github.com/StatiXOS/android_vendor_xiaomi_cannon.git -sc-v2 ./vendor/xiaomi/cannon
```
- Prepare Kernel Source (if not using Prebuilt)
```
cd ~/android/lineage
git clone https://github.com/xiaomi-mt6853-devs/android_kernel_xiaomi_cannon.git -b lineage-19.1 ./kernel/xiaomi/cannon
```
- Start Building your First LineageOS ROM
```
cd ~/android/lineage
source build/envsetup.sh
lunch lineage_cannong-userdebug
```




