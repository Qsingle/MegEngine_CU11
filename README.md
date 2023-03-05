# MegEngine build with cuda 11.x

Build the whl with cuda-11.x, add the support of NVIDIA RTX 30X GPU.

Due to the size of whl being too big, we upload it to [Baidu Cloud Driver](https://pan.baidu.com/s/1qHkv9slHvVSNvSfbjkXgWg), and the extract code:bwwn.

+ 2023.03.05 Update README, and fix some errors.

+ 2023.02.27 Update the whl to the latest version of MegEngine, update README.

+ 2023.01.05 Update the README and add the cu110

+ 2022.10.04 Upload the scripts for build the whl at windows

+ 2022.08.30 Update the whl for MegEngine 1.10.0 (Can find at Baidu Cloud Driver) 
+ 2022.04.21 Fix the bug of release 1.9.0 and upload the py38 for Win64
+ 2022.04.20 Update the whl for MegEngine 1.9.0 (Can find at Baidu Cloud Driver) 
+ 2022.03.06 Update the whl for MegEngine 1.8.2 (Can find at Baidu Cloud Driver)
+ 2022.02.22 Update the whl for MegEngine 1.8.0 (Can find at Baidu Cloud Driver)
+ Update the whl for MegEngine 1.7.0 (Can find at Baidu Cloud Driver)
+ Release before 1.6.0 can find at this [link](https://github.com/Qsingle/MegEngine_CU11/releases)



## Update

​	 Add the script for building MegEngine, you can use this script to build the MegEngine for windows.

### Steps

+ Setup the 7-Zip (Install the program to C:/Program Files (x86) or other position. If you install it to other position, please copy the path and change the path in llvm_install.py and cuda_cudnn_install.py. The 7-zip can be downloaded at https://www.7-zip.org/).

+ Clone the source from github.

  ```shell
  git clone https://github.com/MegEngine/MegEngine.git
  ```

+ Replace `scripts/whl/windows/windows_build_whl.sh` and `scripts/cmake-build/host-build.sh` by the file in this repository.

+ Install the python by the script (Note: Please make sure the python tool:"3.6.8", "3.7.7", "3.8.3", "3.9.4" and "3.10.1" not installed in your PC.). You may get the error:`FullyQualifiedErrorId : UnauthorizedAccess.`, you can follow this [link](https://answers.microsoft.com/en-us/windows/forum/all/fullyqualifiederrorid-unauthorizedaccess/a73a564a-9870-42c7-bd5e-7072eb1a3136) to deal with it.

  ```powershell
  .\scripts\whl\windows\python_install.ps1
  ```

+ Install the Visual Studio Build Tool by the script.

  ```powershell
  .\scripts\whl\windows\vs_buildtool_install.ps1
  ```
  
+ Modify the TensorRT root path in build_whl.sh, or you can download the TensorRT 7.2.3.4 and extract it to `C:/tools` (PS: You can change the TRT_ROOT_DIR defined in build_whl.sh, so you can change the position of the TensorRT).

+ Build the MegEngine.

  ```shell
  ./scripts/whl/windows/build_whl.sh
  ```

  
