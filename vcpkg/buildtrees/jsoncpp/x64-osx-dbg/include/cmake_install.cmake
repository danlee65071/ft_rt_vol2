# Install script for directory: /Users/hcharlsi/Desktop/ft_rt_vol2/vcpkg/buildtrees/jsoncpp/src/1.9.5-13b47286ba.clean/include

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/hcharlsi/Desktop/ft_rt_vol2/vcpkg/packages/jsoncpp_x64-osx/debug")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "OFF")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/json" TYPE FILE FILES
    "/Users/hcharlsi/Desktop/ft_rt_vol2/vcpkg/buildtrees/jsoncpp/src/1.9.5-13b47286ba.clean/include/json/allocator.h"
    "/Users/hcharlsi/Desktop/ft_rt_vol2/vcpkg/buildtrees/jsoncpp/src/1.9.5-13b47286ba.clean/include/json/assertions.h"
    "/Users/hcharlsi/Desktop/ft_rt_vol2/vcpkg/buildtrees/jsoncpp/src/1.9.5-13b47286ba.clean/include/json/config.h"
    "/Users/hcharlsi/Desktop/ft_rt_vol2/vcpkg/buildtrees/jsoncpp/src/1.9.5-13b47286ba.clean/include/json/forwards.h"
    "/Users/hcharlsi/Desktop/ft_rt_vol2/vcpkg/buildtrees/jsoncpp/src/1.9.5-13b47286ba.clean/include/json/json.h"
    "/Users/hcharlsi/Desktop/ft_rt_vol2/vcpkg/buildtrees/jsoncpp/src/1.9.5-13b47286ba.clean/include/json/json_features.h"
    "/Users/hcharlsi/Desktop/ft_rt_vol2/vcpkg/buildtrees/jsoncpp/src/1.9.5-13b47286ba.clean/include/json/reader.h"
    "/Users/hcharlsi/Desktop/ft_rt_vol2/vcpkg/buildtrees/jsoncpp/src/1.9.5-13b47286ba.clean/include/json/value.h"
    "/Users/hcharlsi/Desktop/ft_rt_vol2/vcpkg/buildtrees/jsoncpp/src/1.9.5-13b47286ba.clean/include/json/version.h"
    "/Users/hcharlsi/Desktop/ft_rt_vol2/vcpkg/buildtrees/jsoncpp/src/1.9.5-13b47286ba.clean/include/json/writer.h"
    )
endif()

