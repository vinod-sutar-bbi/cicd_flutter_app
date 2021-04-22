cd ios/build/Build/Products 

zip -r MyTests.zip Debug-iphoneos Runner_iphoneos14.4-arm64-armv7.xctestrun

gcloud firebase test ios run --test MyTests.zip \
 --device model=iphonex,version=11.4,locale=en_US,orientation=portrait \
 --timeout 600