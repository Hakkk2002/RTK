# client maintainer: simon.rit@creatis.insa-lyon.fr
set(CTEST_SITE "linux15.dg.creatis.insa-lyon.fr")
set(CTEST_BUILD_NAME "Linux-64bit-gcc454-cuda32")
set(CTEST_BUILD_CONFIGURATION Release)
set(CTEST_CMAKE_GENERATOR "Unix Makefiles")
set(CTEST_DASHBOARD_ROOT "/tmp/RTK_dashboard")
set(dashboard_binary_name "RTK_lin64_gcc454_cuda32")
set(ENV{ITK_DIR} "/home/srit/src/itk/lin64-dg")
set(ENV{CUDA_BIN_PATH} "/home/srit/Download/cuda32/bin")
set(ENV{PATH} "$ENV{PATH}:/home/srit/src/gcc/gcc436-install/bin")
set(CTEST_BUILD_FLAGS -j8)

set(ENV{LD_LIBRARY_PATH} "/home/srit/src/gcc/gcc454-install/lib64:$ENV{LD_LIBRARY_PATH}")
set(ENV{LD_LIBRARY_PATH} "/home/srit/src/gcc/gcc454-install/lib:$ENV{LD_LIBRARY_PATH}")
set(ENV{PATH} "/home/srit/src/gcc/gcc454-install/bin:$ENV{PATH}")

include("${CTEST_SCRIPT_DIRECTORY}/rtk_common.cmake")

