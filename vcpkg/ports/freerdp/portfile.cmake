vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FreeRDP/FreeRDP
    REF 40ee5d3bcc70343af6c0300d71968858c1f1948f #v2.7.0
    SHA512 b18fa4830a6b4367e28e92fe91b9ae925d5d4fd517b2f6f8655eae7306f181b98e9e611c0cde576f642987c12af6eb862952179f5d7b60019cd7b024fd2db142
    HEAD_REF master
    PATCHES
        DontInstallSystemRuntimeLibs.patch
        fix-linux-build.patch
        openssl_threads.patch
        fix-include-path.patch
        fix-libusb.patch
        install-dirs.patch
)

if (NOT VCPKG_TARGET_IS_WINDOWS)
    message(WARNING "${PORT} currently requires the following libraries from the system package manager:\n    libxfixes-dev\n")
endif()
set(FREERDP_WITH_CLIENT)
if (VCPKG_TARGET_IS_OSX OR VCPKG_TARGET_IS_LINUX)
    set(FREERDP_WITH_CLIENT -DWITH_CLIENT=OFF)
endif()

set(FREERDP_CRT_LINKAGE)
if(VCPKG_CRT_LINKAGE STREQUAL "static")
    set(FREERDP_CRT_LINKAGE -DMSVC_RUNTIME=static)
endif()

get_filename_component(SOURCE_VERSION "${SOURCE_PATH}" NAME)
file(WRITE "${SOURCE_PATH}/.source_version" "${SOURCE_VERSION}-vcpkg")

file(REMOVE "${SOURCE_PATH}/cmake/FindOpenSSL.cmake") # Remove outdated Module

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
    urbdrc CHANNEL_URBDRC
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FREERDP_CRT_LINKAGE}
        ${FREERDP_WITH_CLIENT}
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()
vcpkg_copy_pdbs()

file(GLOB_RECURSE TOOLS_RELEASE "${CURRENT_PACKAGES_DIR}/bin/*.exe")

if(TOOLS_RELEASE)
    file(COPY ${TOOLS_RELEASE} DESTINATION "${CURRENT_PACKAGES_DIR}/tools/${PORT}")
    file(GLOB_RECURSE TOOLS_DEBUG "${CURRENT_PACKAGES_DIR}/debug/bin/*.exe")
    file(REMOVE ${TOOLS_RELEASE} ${TOOLS_DEBUG})
endif()

vcpkg_copy_tool_dependencies("${CURRENT_PACKAGES_DIR}/tools/${PORT}")

if(VCPKG_LIBRARY_LINKAGE STREQUAL "dynamic")
    file(GLOB_RECURSE FREERDP_DLLS "${CURRENT_PACKAGES_DIR}/lib/*.dll")
    foreach(FREERDP_DLL ${FREERDP_DLLS})
        file(COPY "${FREERDP_DLL}" DESTINATION "${CURRENT_PACKAGES_DIR}/bin")
        file(REMOVE "${FREERDP_DLL}")
    endforeach()

    if(NOT VCPKG_BUILD_TYPE)
        file(GLOB_RECURSE FREERDP_DLLS "${CURRENT_PACKAGES_DIR}/debug/lib/*.dll")
        foreach(FREERDP_DLL ${FREERDP_DLLS})
            file(COPY "${FREERDP_DLL}" DESTINATION "${CURRENT_PACKAGES_DIR}/debug/bin")
            file(REMOVE "${FREERDP_DLL}")
        endforeach()
    endif()
else()
    file(GLOB_RECURSE FREERDP_TOOLS "${CURRENT_PACKAGES_DIR}/bin/*")
    foreach(FREERDP_TOOL ${FREERDP_TOOLS})
        file(COPY "${FREERDP_TOOL}" DESTINATION "${CURRENT_PACKAGES_DIR}/tools/${PORT}")
        file(REMOVE "${FREERDP_TOOL}")
    endforeach()
    file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/bin" "${CURRENT_PACKAGES_DIR}/debug/bin")
endif()

foreach(PACKAGE FreeRDP-Client2 FreeRDP2 WinPR2)
    file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/lib/cmake/${PACKAGE}_temp")
    file(RENAME "${CURRENT_PACKAGES_DIR}/lib/cmake/${PACKAGE}" "${CURRENT_PACKAGES_DIR}/lib/cmake/${PACKAGE}_temp/${PACKAGE}")
    if(NOT VCPKG_BUILD_TYPE)
        file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/debug/lib/cmake/${PACKAGE}_temp")
        file(RENAME "${CURRENT_PACKAGES_DIR}/debug/lib/cmake/${PACKAGE}" "${CURRENT_PACKAGES_DIR}/debug/lib/cmake/${PACKAGE}_temp/${PACKAGE}")
    endif()
endforeach()

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/FreeRDP-Client2_temp/FreeRDP-Client2 PACKAGE_NAME FreeRDP-Client)
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/FreeRDP2_temp/FreeRDP2 PACKAGE_NAME FreeRDP)
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/WinPR2_temp/WinPR2 PACKAGE_NAME WinPR)

vcpkg_fixup_pkgconfig(SKIP_CHECK)

if(NOT VCPKG_BUILD_TYPE)
    vcpkg_replace_string("${CURRENT_PACKAGES_DIR}/share/WinPR/WinPRTargets-debug.cmake"
        "debug/lib/winpr2${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX}"
        "debug/bin/winpr2${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX}"
    )
    vcpkg_replace_string("${CURRENT_PACKAGES_DIR}/share/WinPR/WinPRTargets-debug.cmake"
        "debug/lib/winpr-tools2${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX}"
        "debug/bin/winpr-tools2${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX}"
    )
endif()
vcpkg_replace_string("${CURRENT_PACKAGES_DIR}/share/WinPR/WinPRTargets-release.cmake"
    "lib/winpr2${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX}"
    "bin/winpr2${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX}"
)
vcpkg_replace_string("${CURRENT_PACKAGES_DIR}/share/WinPR/WinPRTargets-release.cmake"
    "lib/winpr-tools2${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX}"
    "bin/winpr-tools2${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX}"
)
if(NOT VCPKG_BUILD_TYPE)
    vcpkg_replace_string("${CURRENT_PACKAGES_DIR}/share/FreeRDP/FreeRDPTargets-debug.cmake"
        "debug/lib/freerdp2${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX}"
        "debug/bin/freerdp2${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX}"
    )
endif()
vcpkg_replace_string("${CURRENT_PACKAGES_DIR}/share/FreeRDP/FreeRDPTargets-release.cmake"
    "lib/freerdp2${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX}"
    "bin/freerdp2${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX}"
)
if(NOT VCPKG_BUILD_TYPE)
    vcpkg_replace_string("${CURRENT_PACKAGES_DIR}/share/FreeRDP-Client/FreeRDP-ClientTargets-debug.cmake"
        "debug/lib/freerdp-client2${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX}"
        "debug/bin/freerdp-client2${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX}"
    )
endif()
vcpkg_replace_string("${CURRENT_PACKAGES_DIR}/share/FreeRDP-Client/FreeRDP-ClientTargets-release.cmake"
    "lib/freerdp-client2${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX}"
    "bin/freerdp-client2${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX}"
)

if(VCPKG_TARGET_IS_WINDOWS AND VCPKG_LIBRARY_LINKAGE STREQUAL "static")
    file(GLOB OBJS "${CURRENT_PACKAGES_DIR}/debug/*.lib")
    file(REMOVE ${OBJS})
    file(GLOB OBJS "${CURRENT_PACKAGES_DIR}/*.lib")
    file(REMOVE ${OBJS})
endif()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include"
                    "${CURRENT_PACKAGES_DIR}/debug/share"
                    "${CURRENT_PACKAGES_DIR}/debug/lib/cmake"
                    "${CURRENT_PACKAGES_DIR}/lib/cmake")


vcpkg_replace_string("${CURRENT_PACKAGES_DIR}/include/freerdp/build-config.h" "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel" ".")
vcpkg_replace_string("${CURRENT_PACKAGES_DIR}/include/freerdp/build-config.h" "${CURRENT_PACKAGES_DIR}/" "")
vcpkg_replace_string("${CURRENT_PACKAGES_DIR}/include/freerdp/build-config.h" "${CURRENT_PACKAGES_DIR}" "")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
