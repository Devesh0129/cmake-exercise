cmake_minimum_required(VERSION 3.16)

# deal.II must be found and initialized BEFORE project()
find_package(deal.II 9.5 REQUIRED)
deal_ii_initialize_cached_variables()

project(cmake-exercise LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find Boost (at least 1.65) including the compiled filesystem library
find_package(Boost 1.65 REQUIRED COMPONENTS filesystem)


# Find yaml-cpp (installed from source in the Dockerfile)
find_package(yaml-cpp 0.6.3 REQUIRED)

# Build the program "main" from these source files
add_executable(main
    main.cpp
    fem/fem.cpp
    flatset/flatset.cpp
    filesystem/filesystem.cpp
    yamlParser/yamlParser.cpp
)

# Link Boost: headers for flat_set, the filesystem library for filesystem
target_link_libraries(main Boost::headers Boost::filesystem yaml-cpp)

# Add deal.II's compiler flags, include paths and libraries to "main"
deal_ii_setup_target(main)
