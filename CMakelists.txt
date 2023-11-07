cmake_minimum_required(VERSION 3.23)

project(
  fortran_udunits_test
  VERSION 1.0
  LANGUAGES Fortran
)

list (APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")

include(CMakePrintHelpers)

find_package(udunits REQUIRED)
cmake_print_properties(
  TARGETS udunits::udunits
  PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES
    INTERFACE_LINK_LIBRARIES
)
cmake_print_variables(udunits_VERSION)
cmake_print_variables(udunits_INCLUDE_DIR)
cmake_print_variables(udunits_LIBRARY)
cmake_print_variables(udunits_LIBRARY_SHARED)

find_package(Fortran_UDUNITS2 REQUIRED)
cmake_print_properties(
  TARGETS Fortran_UDUNITS2::Fortran_UDUNITS2
  PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES
    INTERFACE_LINK_LIBRARIES
)
cmake_print_variables(Fortran_UDUNITS2_VERSION)
cmake_print_variables(Fortran_UDUNITS2_INCLUDE_DIR)
cmake_print_variables(Fortran_UDUNITS2_LIBRARY)
cmake_print_variables(Fortran_UDUNITS2_LIBRARY_SHARED)

find_package(EXPAT REQUIRED)

add_executable(test_f_udunits_2 test_f_udunits_2.F90)
target_link_libraries(test_f_udunits_2 Fortran_UDUNITS2::Fortran_UDUNITS2)

install(TARGETS test_f_udunits_2 DESTINATION bin)

# https://www.scivision.dev/cmake-auto-gitignore-build-dir/
# --- auto-ignore build directory
if(NOT EXISTS ${PROJECT_BINARY_DIR}/.gitignore)
  file(WRITE ${PROJECT_BINARY_DIR}/.gitignore "*")
endif()

# Piggyback that file into install
install(
   FILES ${PROJECT_BINARY_DIR}/.gitignore
   DESTINATION ${CMAKE_INSTALL_PREFIX}
   )
