# This is the CMAKE script for cross building POCL.
#
# The below is a shell script to invoke this CMAKE script for
# CMAKE command.
#----------------------------------------------------------------
# #!/usr/bin/env bash
# 
# SYSROOT=<path-to-target-gnu-sysroot>
# TARGET_LLVM_HOME=<path-to-target-llvm-install-root>
# 
# CROSS_C_FLAGS="-I${TARGET_LLVM_HOME}/include"
# CROSS_CXX_FLAGS="-I${TARGET_LLVM_HOME}/include"
# CROSS_LINKER_FLAGS="-L${SYSROOT}/usr/lib/ -lrt -ldl -lc -lpthread -lm -lgcc -L${TARGET_LLVM_HOME}/lib"
# 
# SOURCE_PATH=<path-to-source-code>
# INSTALL_PATH=<path-to-install-dir>
# 
# cmake ${SOURCE_PATH} \
#         -DOCS_AVAILABLE=0 \
#         -DHOST_DEVICE_BUILD_HASH="pthread-x86_64-unknown-linux-gnu-skylake" \
#         -DCMAKE_TOOLCHAIN_FILE=${SOURCE_PATH}/riscv64.gnu.cmake \
#         -DCMAKE_INSTALL_PREFIX=${INSTALL_PATH} \
#         -DLLC_TRIPLE=riscv64-linux \
#         -DLLC_HOST_CPU=riscv64 \
#         -DCMAKE_C_FLAGS="${CROSS_C_FLAGS}" \
#         -DCMAKE_CXX_FLAGS="${CROSS_CXX_FLAGS}" \
#         -DCMAKE_SHARED_LINKER_FLAGS="${CROSS_LINKER_FLAGS}" \
#         -DCMAKE_EXE_LINKER_FLAGS="${CROSS_LINKER_FLAGS}" \
#         -DCMAKE_INCLUDE_PATH=${TARGET_LLVM_HOME}/include \
#         -DCMAKE_LIBRARY_PATH=${TARGET_LLVM_HOME}/lib \
#         -DCMAKE_CROSSCOMPILING=TRUE \
# 
#----------------------------------------------------------------
#
# For riscv64, there are two steps need to be previously done.
#
# First, install two components, hwloc, lttng-ust. 
# $sudo apt install libhwloc-dev
# $sudo apt install liblttng-ust0
#
# Second, install riscv64 gnu tool chain, recommends version 10.
# $sudo apt install gcc-10-riscv64-linux-gnu
# $sudo apt install g++-10-riscv64-linux-gnu
#

SET(CMAKE_SYSTEM_NAME Linux)

# specify the cross compiler
SET(CMAKE_C_COMPILER riscv64-linux-gnu-gcc-10)
SET(CMAKE_CXX_COMPILER riscv64-linux-gnu-g++-10)

# should work, but does not yet. Instead set FIND_ROOT below
# set(CMAKE_SYSROOT /home/a/zynq/ZYNQ_ROOT)
# where is the target environment
SET(CMAKE_FIND_ROOT_PATH /usr/riscv64-linux-gnu)
# where to find libraries in target environment
SET(CMAKE_LIBRARY_PATH /usr/riscv64-linux-gnu/lib)

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

