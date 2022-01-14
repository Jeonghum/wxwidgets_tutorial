
#project(myGreatProject)

set(wxWidgets_CONFIGURATION mswu)

find_package(wxWidgets REQUIRED COMPONENTS net core base)
include(${wxWidgets_USE_FILE})
add_executable(tutorial main.cpp)
target_link_libraries(tutorial ${wxWidgets_LIBRARIES})
