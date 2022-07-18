#!/bin/bash
echo -e "\033[0;32mHow many CPU cores do you want to be used in compiling process? (Default is 1. Press enter for default.)\033[0m"
read -e CPU_CORES
if [ -z "$CPU_CORES" ]
then
    CPU_CORES=1
fi

# Upgrade the system and install required dependencies
	sudo apt update
	sudo apt-get install curl librsvg2-bin libtiff-tools bsdmainutils cmake imagemagick libcap-dev libz-dev libbz2-dev python3-setuptools bsdmainutils libtinfo5 xorriso
	sudo apt-get install make automake cmake curl g++-multilib libtool binutils-gold bsdmainutils pkg-config python3 patch biso

# Clone code from official Github repository
	rm -rf metaaco
	git clone https://github.com/antares-codes/metaaco.git

# Entering directory
	cd metaaco

# Compile dependencies
	cd depends
	mkdir SDKs
	cd SDKs
	wget https://github.com/phracker/MacOSX-SDKs/releases/download/10.15/MacOSX10.11.sdk.tar.xz
	tar -xf MacOSX10.11.sdk.tar.xz
	cd ..
	cd ..

# Compile
	./autogen.sh
	./configure --prefix=$(pwd)/depends/x86_64-apple-darwin14 --enable-cxx --enable-static --disable-shared --disable-debug --disable-tests --disable-bench --disable-online-rust
	make -j$(echo $CPU_CORES) HOST=x86_64-apple-darwin14
	make deploy
	cd ..

# Create zip file of binaries
	strip -s metaaco/src/metaacod metaaco/src/metaaco-cli metaaco/src/metaaco-tx metaaco/src/qt/metaaco-qt
	cp metaaco/src/metaacod metaaco/src/metaaco-cli metaaco/src/metaaco-tx metaaco/src/qt/metaaco-qt metaaco/metaaco-Core.dmg .
	zip metaaco-MacOS.zip metaacod metaaco-cli metaaco-tx metaaco-qt metaaco-Core.dmg
	rm -f metaacod metaaco-cli metaaco-tx metaaco-qt metaaco-Core.dmg
