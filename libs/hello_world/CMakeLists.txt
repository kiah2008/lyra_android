cmake_minimum_required(VERSION 3.16)
project("hello world")

ADD_EXECUTABLE(helloworld
        nativelib.cpp
        )
TARGET_LINK_LIBRARIES(helloworld
        PRIVATE
        ${GLOG_LIBS}
        ghc_filesystem
        ${ABSL_LIBS}
        )
