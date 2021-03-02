flutter clean

flutter build ios --no-codesign

cd ios

xcodebuild -workspace Runner.xcworkspace \
-scheme Runner \
-derivedDataPath build \
-sdk iphoneos build-for-testing

ls

cd build/Build/Products 

zip -r MyTests.zip Debug-iphoneos  Runner_iphoneos14.4-arm64.xctestrun