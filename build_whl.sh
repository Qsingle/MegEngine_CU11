#!/bin/base -e
export SDK_NAME="cu112"
echo "Install LLVM"
${PWD}/python_dev/3.8.3/python3.exe scripts/whl/windows/llvm_install.py --install_path=./llvm_tool
export LLVM_PATH=$PWD/llvm_tool
echo "Install CUDA and CUDNN"
${PWD}/python_dev/3.8.3/python3.exe scripts/whl/windows/cuda_cudnn_install.py --sdk_name $SDK_NAME
echo "Preparing python enviroment"
versions="3.6.8 3.7.7 3.8.3 3.9.4"
for ver in $versions
do 
    $PWD/python_dev/$ver/python.exe -m pip install --upgrade pip -i https://mirrors.sustech.edu.cn/pypi/simple
    $PWD/python_dev/$ver/python.exe -m pip install cython -i https://mirrors.sustech.edu.cn/pypi/simple
    $PWD/python_dev/$ver/python.exe -m pip install -r $PWD/imperative/python/requires.txt -i https://mirrors.sustech.edu.cn/pypi/simple
    $PWD/python_dev/$ver/python.exe -m pip install -r $PWD/imperative/python/requires-test.txt -i https://mirrors.sustech.edu.cn/pypi/simple
done
export CUDA_ROOT_DIR="$PWD/cuda_tool/nvcc"
export CUDNN_ROOT_DIR="$PWD/cuda_tool/Library"
TRT_DIR="TensorRT-7.2.3.4"
export TRT_ROOT_DIR="/c/tools/$TRT_DIR"
export TRT_VERSION=${TRT_DIR#*-}
export VS_PATH="$PWD/vs"
export PYTHON_ROOT="$PWD/python_dev"
if [[ $SDK_NAME -eq "cu112" || $SDK_NAME -eq "cu114" ]]; then
    export EXTRA_CMAKE_FLAG=" -DMGE_WITH_CUDNN_SHARED=ON -DMGE_WITH_CUBLAS_SHARED=ON \
            -DMGE_CUDA_GENCODE=\"-gencode arch=compute_61,code=sm_61 \
            -gencode arch=compute_70,code=sm_70 \
            -gencode arch=compute_75,code=sm_75 \
            -gencode arch=compute_80,code=sm_80 \
            -gencode arch=compute_86,code=sm_86 \
            -gencode arch=compute_86,code=compute_86\" "
    if [[ $TRT_VERSION -eq "7.2.3.4" ]]; then
        if [[ ! -f $PWD/cuda_tool/nvcc/bin/nvrtc64_110_0.dll ]]; then
            curl -SL https://dubaseodll.zhhainiao.com/dll/nvrtc64_110_0.dll --output $PWD/cuda_tool/nvcc/bin/nvrtc64_110_0.dll
        fi
    fi
    
elif [[ $SDK_NAME -eq "cu101" ]]; then
    EXTRA_CMAKE_FLAG=" -DMGE_WITH_CUDNN_SHARED=OFF -DMGE_WITH_CUBLAS_SHARED=OFF"
else
    export BUILD_WHL_CPU_ONLY="ON"
fi
./scripts/whl/windows/windows_build_whl.sh