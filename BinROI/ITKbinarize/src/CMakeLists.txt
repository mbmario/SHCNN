PROJECT(binarize)

CMAKE_MINIMUM_REQUIRED(VERSION 2.8) 

FIND_PACKAGE(ITK REQUIRED)
IF(ITK_FOUND)
  INCLUDE(${USE_ITK_FILE})
ENDIF(ITK_FOUND)

SET(CMAKE_BUILD_TYPE Debug)

ADD_EXECUTABLE(binarize main.cxx)
TARGET_LINK_LIBRARIES(binarize ${ITK_LIBRARIES})
