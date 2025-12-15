# keep meta data style of upstream
VERSION=4200
ARCH=x64
SOURCE="https://download.sublimetext.com/sublime_text_build_$(VERSION)_$(ARCH).tar.xz"
DESTINATION="subl.tar.xz"
OUTPUT="Sublime-Text_$(VERSION)_$(ARCH).AppImage"

all:
	echo "Building: $(OUTPUT)"
	wget -O $(DESTINATION) -c $(SOURCE)

	tar -xvf $(DESTINATION)
	rm -rf AppDir/opt

	mkdir --parents AppDir/opt/application
	cp -r sublime_text/* AppDir/opt/application

	chmod +x AppDir/AppRun

	export ARCH=x86_64 && tools/appimagetool.AppImage AppDir $(OUTPUT)
	chmod +x $(OUTPUT)

	rm -f $(DESTINATION)
	rm -rf AppDir/opt
	rm -rf sublime_text
