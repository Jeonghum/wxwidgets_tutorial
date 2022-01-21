cmake_minimum_required (VERSION 3.22)

project(tutorial)

set(CMAKE_BUILD_TYPE "Debug" CACHE STRING "")

if(CMAKE_BUILD_TYPE MATCHES Release)
  message("release mode")
  set(wxWidgets_CONFIGURATION mswu)
  set(CMAKE_CONFIGURATION_TYPES "Release" CACHE STRING "" FORCE)
else()
  message("debug mode")
  set(wxWidgets_CONFIGURATION mswud)
  set(CMAKE_CONFIGURATION_TYPES "Debug" CACHE STRING "" FORCE)
endif()

find_package(wxWidgets REQUIRED COMPONENTS net core base)
include(${wxWidgets_USE_FILE})
add_executable(tutorial main.cpp)
target_link_libraries(tutorial ${wxWidgets_LIBRARIES})

#cmake debugging example
#message(STATUS "wxWidgets_LIBRARIES=${wxWidgets_LIBRARIES}")
#message(STATUS "wxWidgets_USE_FILE=${wxWidgets_USE_FILE}")

install(TARGETS tutorial DESTINATION bin)
if(CMAKE_BUILD_TYPE MATCHES Release)
  install(FILES ${wxWidgets_LIB_DIR}/wxbase315u_vc_happynhealthy.dll DESTINATION bin)
  install(FILES ${wxWidgets_LIB_DIR}/wxmsw315u_core_vc_happynhealthy.dll DESTINATION bin)
else()
  install(FILES ${wxWidgets_LIB_DIR}/wxbase315ud_vc_happynhealthy.dll DESTINATION bin)
  install(FILES ${wxWidgets_LIB_DIR}/wxmsw315ud_core_vc_happynhealthy.dll DESTINATION bin)
endif()

include(InstallRequiredSystemLibraries)
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/License.txt")
set(CPACK_PACKAGE_VERSION_MAJOR "0")
set(CPACK_PACKAGE_VERSION_MINOR "1")
include(CPack)

