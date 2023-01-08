# Author: Kevin Murray
# Purpose

function(gtest_unittestList_Init)
    set(gtest_UNITTEST_LIST ""
        CACHE INTERNAL "gtest_UNITTEST_LIST path list" FORCE)
endfunction()

function(gtest_unittestList_Add)
    # Add each entry to the specified variable's path list
    set(LocalList ${gtest_UNITTEST_LIST})
    foreach(ARG ${ARGN})
        foreach(UT_FILE ${ARG})
            list(APPEND LocalList ${UT_FILE})
        endforeach()
    endforeach()
    list(REMOVE_DUPLICATES LocalList)
    set(gtest_UNITTEST_LIST ${LocalList}
        CACHE INTERNAL "gtest_UNITTEST_LIST path list" FORCE)
endfunction()

function(gtest_unittestList_Get Varname outputVar)
    set(${outputVar} ${gtest_UNITTEST_LIST} PARENT_SCOPE)
endfunction()

function(gtest_unittestList_Print Msg)
    message(STATUS "${Msg}")
    list(APPEND CMAKE_MESSAGE_INDENT "    ")
    foreach(item ${gtest_UNITTEST_LIST})
        message(NOTICE "${item}")
    endforeach()
endfunction()
