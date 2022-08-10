cmake_minimum_required(VERSION 3.16)
project("hello world")

ADD_EXECUTABLE(helloworld
        nativelib.cpp
        )
TARGET_LINK_LIBRARIES(helloworld
        ${GLOG_LIBS}
        )
