# MegEngine build with cuda 11.x

Build the whl with cuda-11.x, add the support of NVIDIA RTX 30X GPU.

Due to the size of whl being too big, we upload it to [Baidu Cloud Driver](https://pan.baidu.com/s/1qHkv9slHvVSNvSfbjkXgWg), and the extract code:bwwn.

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

+ Clone the source from github.

  ```shell
  git clone https://github.com/MegEngine/MegEngine.git
  ```

  

+ Replace the files in `scripts/whl/windows` and `scripts/cmake-build` by the file in this repository.

+ Install the python by the script ((Note: The python tool that needs to install from the script must not have been installed on your computer).).

  ```powershell
  .\scripts\whl\windows\python_install.ps1
  ```

+ Install the Visual Studio Build Tool by the script.

  ```powershell
  .\scripts\whl\windows\python_install.ps1
  ```

+ Build the MegEngine.

  ```shell
  ./scripts/whl/windows/build_whl.sh
  ```

  
