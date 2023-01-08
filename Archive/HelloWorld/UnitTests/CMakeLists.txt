include(FetchContent)
include(gtest_unittestList)

set(TARGET utHelloWorld)
set(PROJECT_FOLDER ${PROJECT_FOLDER}/${TARGET})
set(UT_LIBRARY_NAME GTest::GTest)
set(SOURCES
    utHelloWorld.cpp
    utMain.cpp
)

gtest_unittestList_Add(${TARGET})
gtest_unittestList_Print("Built Unit Tests:")

FetchContent_Declare(googletest
                     GIT_REPOSITORY https://github.com/google/googletest.git
                     GIT_TAG        release-1.12.1
)
FetchContent_MakeAvailable(googletest)

add_library(${UT_LIBRARY_NAME} INTERFACE IMPORTED)
target_link_libraries(${UT_LIBRARY_NAME} INTERFACE gtest_main)
add_executable(${TARGET} ${SOURCES})
target_link_libraries(${TARGET}
                      PRIVATE ${UT_LIBRARY_NAME}
)

add_test(NAME ${TARGET} COMMAND ${TARGET} --gtest_brief)
add_custom_command(TARGET ${TARGET}
                   COMMENT "Running Unit Tests for the HelloWorld library"
                   POST_BUILD COMMAND ctest -C ${CMAKE_BUILD_TYPE} --output-on-failure
)

# Group the target library into an IDE folder
set_target_properties(${TARGET} PROPERTIES FOLDER ${PROJECT_FOLDER})
