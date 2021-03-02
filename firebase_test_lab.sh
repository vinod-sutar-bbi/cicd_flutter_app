flutter clean

flutter build ios --no-codesign

cd ios

xcodebuild -workspace Runner.xcworkspace \
-scheme Runner \
-derivedDataPath build \
-sdk iphoneos build-for-testing \
CODE_SIGN_IDENTITY="" \
CODE_SIGNING_REQUIRED="NO" \
CODE_SIGN_ENTITLEMENTS="" \
CODE_SIGNING_ALLOWED="NO"

ls

cd build/Build/Products 

zip -r MyTests.zip Debug-iphoneos  Runner_iphoneos14.4-arm64.xctestrun