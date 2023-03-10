#!/usr/bin/env bash
# Copyright (C) 2020-2022 Oktapra Amtono <oktapra.amtono@gmail.com>
# Docker Kernel Build Script

# Clone kernel source
if [[ "$*" =~ "stable" ]]; then
    git clone --depth=1 https://github.com/TianWalkzzMiku/SRyzen-CAF.git -b caf kernel
    cd kernel || exit
fi

# Fetch changes from secondary repository
git fetch https://github.com/Evolution-X-Devices/kernel_xiaomi_sdm660 tiramisu
git merge --allow-unrelated-histories FETCH_HEAD

# Clone toolchain
if [[ "$*" =~ "clang" ]]; then
    git clone --depth=1 https://gitlab.com/Panchajanya1999/azure-clang clang
elif [[ "$*" =~ "gcc" ]]; then
    git clone --depth=1 https://github.com/avinakefin/GCC-12-arm32 arm32
    git clone --depth=1 https://github.com/avinakefin/GCC-12-aarch64 arm64
fi

# Clone anykernel3
git clone --depth=1 https://github.com/TianWalkzzMiku/AK3-4.4.git -b lavender-dtb ak3-lavender
git clone --depth=1 https://github.com/TianWalkzzMiku/AK3-4.4.git -b whyred-dtb ak3-whyred
git clone --depth=1 https://github.com/TianWalkzzMiku/AK3-4.4.git -b tulip-dtb ak3-tulip
git clone --depth=1 https://github.com/TianWalkzzMiku/AK3-4.4.git -b a26x-dtb ak3-a26x
