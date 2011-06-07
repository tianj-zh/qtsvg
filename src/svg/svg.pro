load(qt_module)

TARGET     = QtSvg
QPRO_PWD   = $$PWD
QT         = core-private gui-private

CONFIG += module
MODULE_PRI = ../../modules/qt_svg.pri

DEFINES   += QT_BUILD_SVG_LIB
DEFINES   += QT_NO_USING_NAMESPACE
win32-msvc*|win32-icc:QMAKE_LFLAGS += /BASE:0x66000000
solaris-cc*:QMAKE_CXXFLAGS_RELEASE -= -O2

unix|win32-g++*:QMAKE_PKGCONFIG_REQUIRES = QtCore QtGui

load(qt_module_config)

HEADERS += qtsvgversion.h

HEADERS += \
	qsvggraphics_p.h        \
	qsvghandler_p.h         \
	qsvgnode_p.h            \
	qsvgstructure_p.h       \
	qsvgstyle_p.h           \
        qsvgfont_p.h            \
	qsvgtinydocument_p.h    \
	qsvgrenderer.h          \
        qsvgwidget.h            \
        qgraphicssvgitem.h      \
        qsvggenerator.h


SOURCES += \
	qsvggraphics.cpp        \
	qsvghandler.cpp         \
	qsvgnode.cpp            \
	qsvgstructure.cpp       \  
	qsvgstyle.cpp           \
        qsvgfont.cpp            \
	qsvgtinydocument.cpp    \
	qsvgrenderer.cpp        \
        qsvgwidget.cpp          \
        qgraphicssvgitem.cpp    \
        qsvggenerator.cpp

INCLUDEPATH += $$QT_SOURCE_TREE/src/3rdparty/harfbuzz/src

symbian:TARGET.UID3=0x2001B2E2

contains(QT_CONFIG, system-zlib) {
    symbian:                 LIBS_PRIVATE += -llibz
    else:if(unix|win32-g++*):LIBS_PRIVATE += -lz
    else:                    LIBS += zdll.lib
} else {
    error("Using non system zlib is currently unsupported")
}
