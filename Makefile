all: mknz-one.zip

mknz-one.zip: system/product/overlay/A2dpSink.apk
	zip -r9 mknz-one.zip * -x "*/.gitkeep" -x "build/*"

build/vendor_hardware_overlay:
	mkdir -p ./build && cd ./build && git clone https://github.com/MKNZ-OSS/vendor_hardware_overlay --depth=1

system/product/overlay/A2dpSink.apk: build/vendor_hardware_overlay
	cd ./build/vendor_hardware_overlay/build && ./build.sh ../A2dpSink && cp ./treble-overlay-a2dpsink.apk ../../../system/product/overlay/A2dpSink.apk

