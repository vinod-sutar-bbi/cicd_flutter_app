flutter clean

flutter build ios integration_test/custom_integration_test.dart

cd ios

xcodebuild -workspace Runner.xcworkspace \
-derivedDataPath build \
-scheme Runner \
-sdk iphoneos build-for-testing 
-allowProvisioningUpdate

# xcodebuild test-without-building \
# -xctestrun "build/Build/Products/Runner_iphoneos14.2-arm64-armv7.xctestrun" \
# -destination id=5622a27c468b794d50e92c617e0682a9e4cd5804

cd build/Build/Products 

zip -r MyTests.zip Debug-iphoneos  Runner_iphoneos14.4-arm64-armv7.xctestrun

gcloud firebase test ios run --test MyTests.zip \
 --device model=iphonex,version=11.4,locale=en_US,orientation=portrait

rm -r build