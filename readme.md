# <p align="center">Machine Learning - Cascade Classification using OpenCV</p>

## Install OpenCV

Follow this tutorial: https://www.pyimagesearch.com/2018/05/28/ubuntu-18-04-how-to-install-opencv/

Be carefull during your installation: check path of site-package (in my case "/usr/local/lib/python3.6/site-packages")
According to previous path, replace python3 by python3.6 in previous tutorial:

"mkvirtualenv cv -p python"
becomes:
```
 mkvirtualenv cv -p python3.6
```

cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D INSTALL_PYTHON_EXAMPLES=ON -D INSTALL_C_EXAMPLES=OFF -D OPENCV_ENABLE_NONFREE=ON -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules -D PYTHON_EXECUTABLE=~/.virtualenvs/cv/bin/python -D BUILD_EXAMPLES=ON ..
becomes:
```
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D INSTALL_PYTHON_EXAMPLES=ON -D INSTALL_C_EXAMPLES=OFF -D OPENCV_ENABLE_NONFREE=ON -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules -D PYTHON_EXECUTABLE=~/.virtualenvs/cv/bin/python3.6 -D BUILD_EXAMPLES=ON ..
```

## Launch script to teach
facesDetection/train/negatives/run.sh

## run.sh script explanation


