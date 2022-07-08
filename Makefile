# Makefile
  
SHELL := /bin/bash

DOCKER_NAME ?= uCore-RV-64-Base
DIR := workplace
.PHONY: docker build_docker

run: test2

test: test3 test4 test5 test6 test7 test8

lab1: test3

lab2: test4

lab3: test5

lab4: test6 test7

lab5: test8

setup:
	rm -rf  ${DIR}
	mkdir ${DIR}
	cp -r easy-fs ${DIR}
	cp -r easy-fs-fuse ${DIR}
	cp -r ci-user ${DIR}
	cp -r bootloader ${DIR}
	cp -r reports ${DIR}
	cp rust-toolchain ${DIR}
#	export PATH=${PATH}:${HOME}/qemu-7.0.0:${HOME}/qemu-7.0.0/riscv64-softmmu


test1:
	git submodule init
	git submodule update
	cd uCore-RV-64-lab && git checkout ch1 && make run

test2:
	git submodule init
	git submodule update
	cp -r uCore-RV-64-test uCore-RV-64-lab/user
	cd uCore-RV-64-lab && git checkout ch2 && make run
	
test3:
	git submodule init
	git submodule update
	cd uCore-RV-64-lab && git checkout ch2 && make runtest1:
	
test4:
	git submodule init
	git submodule update
	cd uCore-RV-64-lab && git checkout ch1 && make run
	
test5:
	git submodule init
	git submodule update
	cd uCore-RV-64-lab && git checkout ch1 && make run

test6:
	git submodule init
	git submodule update
	cd uCore-RV-64-lab && git checkout ch1 && make run
	
test7:
	git submodule init
	git submodule update
	cd uCore-RV-64-lab && git checkout ch1 && make runtest1:
	
test8:
	git submodule init
	git submodule update
	cd uCore-RV-64-lab && git checkout ch1 && make run

clean:
	rm -rf ${DIR}

docker:
	docker run --rm -it -v ${PWD}:/mnt -w /mnt ${DOCKER_NAME} bash

build_docker: 
	docker build -t ${DOCKER_NAME} .

setupclassroom_test1:
	mkdir -p .github/classroom/
	mkdir -p .github/workflows/
	touch .github/.keep
	cp scripts/autograding-test1.json .github/classroom/autograding.json
	cp scripts/classroom.yml .github/workflows/classroom.yml
	git add .github/classroom/autograding.json
	git add .github/workflows/classroom.yml
	git add .github/.keep
	git commit -m"update classroom.yml .keep autograding.json for classroom CI test"
	git push

setupclassroom_test2:
	mkdir -p .github/classroom/
	mkdir -p .github/workflows/
	touch .github/.keep
	cp scripts/autograding-test2.json .github/classroom/autograding.json
	cp scripts/classroom.yml .github/workflows/classroom.yml
	git add .github/classroom/autograding.json
	git add  .github/workflows/classroom.yml
	git add  .github/.keep
	git commit -m"update classroom.yml .keep autograding.json for classroom CI test"
	git push

setupclassroom_test3:
	mkdir -p .github/classroom/
	mkdir -p .github/workflows/
	touch .github/.keep
	cp scripts/autograding-test3.json .github/classroom/autograding.json
	cp scripts/classroom.yml .github/workflows/classroom.yml
	git add .github/classroom/autograding.json
	git add .github/workflows/classroom.yml
	git add .github/.keep
	git commit -m"update classroom.yml .keep autograding.json for classroom CI test"
	git push

setupclassroom_test4:
	mkdir -p .github/classroom/
	mkdir -p .github/workflows/
	touch .github/.keep
	cp scripts/autograding-test4.json .github/classroom/autograding.json
	cp scripts/classroom.yml .github/workflows/classroom.yml
	git add .github/classroom/autograding.json
	git add .github/workflows/classroom.yml
	git add .github/.keep
	git commit -m"update classroom.yml .keep autograding.json for classroom CI test"
	git push

setupclassroom_test5:
	mkdir -p .github/classroom/
	mkdir -p .github/workflows/
	touch .github/.keep
	cp scripts/autograding-test5.json .github/classroom/autograding.json
	cp scripts/classroom.yml .github/workflows/classroom.yml
	git add .github/classroom/autograding.json
	git add .github/workflows/classroom.yml
	git add .github/.keep
	git commit -m"update classroom.yml .keep autograding.json for classroom CI test"
	git push

setupclassroom_test6:
	mkdir -p .github/classroom/
	mkdir -p .github/workflows/
	touch .github/.keep
	cp scripts/autograding-test6.json .github/classroom/autograding.json
	cp scripts/classroom.yml .github/workflows/classroom.yml
	git add .github/classroom/autograding.json
	git add .github/workflows/classroom.yml
	git add .github/.keep
	git commit -m"update classroom.yml .keep autograding.json for classroom CI test"
	git push

setupclassroom_test7:
	mkdir -p .github/classroom/
	mkdir -p .github/workflows/
	touch .github/.keep
	cp scripts/autograding-test7.json .github/classroom/autograding.json
	cp scripts/classroom.yml .github/workflows/classroom.yml
	git add .github/classroom/autograding.json
	git add .github/workflows/classroom.yml
	git add .github/.keep
	git commit -m"update classroom.yml .keep autograding.json for classroom CI test"
	git push

setupclassroom_test8:
	mkdir -p .github/classroom/
	mkdir -p .github/workflows/
	touch .github/.keep
	cp scripts/autograding-test8.json .github/classroom/autograding.json
	cp scripts/classroom.yml .github/workflows/classroom.yml
	git add .github/classroom/autograding.json
	git add .github/workflows/classroom.yml
	git add .github/.keep
	git commit -m"update classroom.yml .keep autograding.json for classroom CI test"
	git push

# for local ubuntu with zsh shell SHELL, need root for sudo 
ubuntu:
        cd ${HOME} && sudo wget https://static.dev.sifive.com/dev-tools/freedom-tools/v2020.08/riscv64-unknown-elf-gcc-10.1.0-2020.08.2-x86_64-linux-ubuntu14.tar.gz
        cd ${HOME} && sudo tar xzf riscv64-unknown-elf-gcc-10.1.0-2020.08.2-x86_64-linux-ubuntu14.tar.gz
        cd ${HOME} && sudo mv riscv64-unknown-elf-gcc-10.1.0-2020.08.2-x86_64-linux-ubuntu14 riscv64-unknown-elf-gcc
        cd ${HOME} && sudo wget -O riscv64-linux-musl-cross.tgz https://cloud.tsinghua.edu.cn/f/b07bac9bcfa14f1dae66/?dl=1
        cd ${HOME} && sudo tar xzf riscv64-linux-musl-cross.tgz
        sudo echo "export PATH="${HOME}/riscv64-unknown-elf-gcc/bin:$$PATH\"" >>  ~/.bashrc
        sudo echo "export PATH="${HOME}/riscv64-linux-musl-cross/bin:$$PATH\"" >> ~/.bashrc
        source ~/.bashrc  
        sudo apt install -y cmake
        sudo apt update -y
        sudo apt upgrade -y
        sudo apt install -y autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev \
                      gawk build-essential bison flex texinfo gperf libtool patchutils bc \
                      zlib1g-dev libexpat-dev pkg-config  libglib2.0-dev libpixman-1-dev git tmux python3
        sudo wget https://download.qemu.org/qemu-5.0.0.tar.xz
        cd ${HOME} && sudo tar xJf qemu-5.0.0.tar.xz
        cd ${HOME}/qemu-5.0.0 && sudo ./configure --target-list=riscv64-softmmu,riscv64-linux-user
        cd ${HOME}/qemu-5.0.0 && sudo make -j$(nproc)
        cd ${HOME}/qemu-5.0.0 && sudo make install
        sudo echo "export PATH=\"${HOME}/qemu-5.0.0:$$PATH\"" >> ~/.bashrc
        sudo echo "export PATH=\"${HOME}/qemu-5.0.0/riscv64-softmmu:$$PATH\"" >> ~/.bashrc
        sudo echo "export PATH=\"${HOME}/qemu-5.0.0/riscv64-linux-user:$$PATH\"" >> ~/.bashrc
        source ~/.bashrc
        qemu-system-riscv64 --version
        qemu-riscv64 --version
        rustc --version
	
	sudo apt install autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev \
              gawk build-essential bison flex texinfo gperf libtool patchutils bc \
              zlib1g-dev libexpat-dev pkg-config  libglib2.0-dev libpixman-1-dev git tmux python3 ninja-build zsh -y
	cd ${HOME} && wget https://download.qemu.org/qemu-7.0.0.tar.xz
	cd ${HOME} && tar xvJf qemu-7.0.0.tar.xz
	cd ${HOME}/qemu-7.0.0 && ./configure --target-list=riscv64-softmmu,riscv64-linux-user
	cd ${HOME}/qemu-7.0.0 && make -j$(nproc)
	cd ${HOME}/qemu-7.0.0 && sudo make install
	qemu-system-riscv64 --version
	qemu-riscv64 --version
	curl https://sh.rustup.rs -sSf | sh -s -- -y
	source ${HOME}/.cargo/env
	rustc --version
	


ubuntu:
        cd ${HOME} && sudo wget https://static.dev.sifive.com/dev-tools/freedom-tools/v2020.08/riscv64-unknown-elf-gcc-10.1.0-2020.08.2-x86_64-linux-ubuntu14.tar.gz
        cd ${HOME} && sudo tar xzf riscv64-unknown-elf-gcc-10.1.0-2020.08.2-x86_64-linux-ubuntu14.tar.gz
        cd ${HOME} && sudo mv riscv64-unknown-elf-gcc-10.1.0-2020.08.2-x86_64-linux-ubuntu14 riscv64-unknown-elf-gcc
        cd ${HOME} && sudo wget -O riscv64-linux-musl-cross.tgz https://cloud.tsinghua.edu.cn/f/b07bac9bcfa14f1dae66/?dl=1
        cd ${HOME} && sudo tar xzf riscv64-linux-musl-cross.tgz
        sudo echo export PATH=\"\$$HOME/riscv64-unknown-elf-gcc/bin:\$$PATH\" >>  ~/.bashrc
        sudo echo export PATH=\"\$$HOME/riscv64-linux-musl-cross/bin:\$$PATH\" >> ~/.bashrc
        source ~/.bashrc  
        sudo apt install -y cmake
        sudo apt update -y
        sudo apt upgrade -y
        sudo apt install -y autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev \
                      gawk build-essential bison flex texinfo gperf libtool patchutils bc \
                      zlib1g-dev libexpat-dev pkg-config  libglib2.0-dev libpixman-1-dev git tmux python3
        cd ${HOME} && sudo wget https://download.qemu.org/qemu-5.0.0.tar.xz
        cd ${HOME} && sudo tar xJf qemu-5.0.0.tar.xz
        cd ${HOME}/qemu-5.0.0 && sudo ./configure --target-list=riscv64-softmmu,riscv64-linux-user
        cd ${HOME}/qemu-5.0.0 && sudo make -j$$(nproc)
        cd ${HOME}/qemu-5.0.0 && sudo make install
        sudo echo export PATH=\"\$${HOME}/qemu-5.0.0:\$$PATH\" >> ~/.bashrc
        sudo echo export PATH=\"\$${HOME}/qemu-5.0.0/riscv64-softmmu:\$$PATH\" >> ~/.bashrc
        sudo echo export PATH=\"\$${HOME}/qemu-5.0.0/riscv64-linux-user:\$$PATH\" >> ~/.bashrc
        source ~/.bashrc
        qemu-system-riscv64 --version
        qemu-riscv64 --version
        rustc --version

# for github codespaces ubuntu with zsh SHELL, need root for sudo
codespaces_setenv:	
	sudo apt install autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev \
              gawk build-essential bison flex texinfo gperf libtool patchutils bc \
              zlib1g-dev libexpat-dev pkg-config  libglib2.0-dev libpixman-1-dev git tmux python3 ninja-build zsh -y
	cd .. && wget https://download.qemu.org/qemu-7.0.0.tar.xz
	cd .. && tar xvJf qemu-7.0.0.tar.xz
	cd ../qemu-7.0.0 && ./configure --target-list=riscv64-softmmu,riscv64-linux-user
	cd ../qemu-7.0.0 && make -j$(nproc)
	cd ../qemu-7.0.0 && sudo make install
	qemu-system-riscv64 --version
	qemu-riscv64 --version
	curl https://sh.rustup.rs -sSf | sh -s -- -y
	/bin/zsh && source /home/codespace/.cargo/env
	rustc --version
