gcloud info

flutter clean

flutter build ios --no-codesign

cd ios

xcodebuild -workspace Runner.xcworkspace \
-scheme Runner \
-derivedDataPath build \
-sdk iphoneos build-for-testing

cd build/Build/Products 

zip -r MyTests.zip Debug-iphoneos  Runner_iphoneos14.2-arm64.xctestrun