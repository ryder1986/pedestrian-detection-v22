unix{
#PROJECT_ROOT="/root/repo-github"
CVPATH="/root/repo-github/libs/third-party/opencv"
CV_PREFIX="/opencv-linux-x86"
#COMMON_LIB_PATH="/root/repo-github/res/common/lib-linux32"
##DESTDIR=/root/repo-github/build/
}

win32{
#PROJECT_ROOT="Z:\\"
CVPATH="Z:\libs\third-party\opencv"
CV_PREFIX="\opencv-vs2013-x86"
#COMMON_LIB_PATH="Z:\res\common\lib-win32"
##DESTDIR=Z:\build
}

unix{
DEFINES +=IS_UNIX
}

win32{
DEFINES +=IS_WIN32
}

unix{
    DEFINES += IS_UNIX
    QMAKE_CXXFLAGS+="-std=c++11"
    INCLUDEPATH +="$$CVPATH/$$CV_PREFIX/include"
    LIBS+=-L$$CVPATH/$$CV_PREFIX/lib -lopencv_core -lopencv_highgui \
       -lopencv_objdetect -lopencv_imgproc -lopencv_ml   -lX11
    QMAKE_LIBS+=-lpthread
}

win32{
    INCLUDEPATH +="$$CVPATH\\$$CV_PREFIX\include"
    message(includepath:$$INCLUDEPATH)
    CONFIG(debug, debug|release){
        LIBS+=-L$$CVPATH\\$$CV_PREFIX\lib -lopencv_core249d -lopencv_highgui249d\
        -lopencv_objdetect249d -lopencv_imgproc249d -lopencv_ml249d
    }else{
        LIBS+=-L$$CVPATH\\$$CV_PREFIX\lib  -lopencv_core249 -lopencv_highgui249 \
        -lopencv_objdetect249 -lopencv_imgproc249 -lopencv_ml249
    }
}

