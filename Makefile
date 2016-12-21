#Makefile
#可执行文件javac位置
JAVAC=javac
#可执行文件java位置
JAVA=java
#可执行文件jar位置
JAR=jar
#.class文件存放目录
CLASSES=classes
#第三方库所在目录
LIB=lib/lib
#解析依赖的jar包
JARS=$(wildcard $(LIB)/*.jar)
noop=
space=$(noop) $(noop)
DEPENDENCIES=$(subst $(space),:,$(JARS))
#源码所在目录
SRC=src/main/java
#主类所在位置
MAINFILE=$(SRC)/com/persist/VideoGrabber.java
#主类名称
MAINCLASS=com.persist.VideoGrabber
#源码最外层包目录名(若有多个最外层目录，jar命令将不通用)
JARDIR=com
#并打包后jar文件名
JARFILE=Grabber.jar

all: $(MAINFILE)
	mkdir -p $(CLASSES)
	$(JAVAC) -classpath $(DEPENDENCIES) -sourcepath $(SRC) $(MAINFILE) -d $(CLASSES)

jar: 
	$(JAR) cvf $(JARFILE) -C $(CLASSES) $(JARDIR)

run:
	$(JAVA) -Djava.ext.dirs=$(LIB) -classpath $(CLASSES) $(MAINCLASS)

.PHONY: clean

clean:
	rm -rf $(CLASSES)

