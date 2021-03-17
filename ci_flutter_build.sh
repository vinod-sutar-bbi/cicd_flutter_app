flutter clean

# rm ios/Podfile.lock

flutter build ios integration_test/custom_integration_test.dart

# flutter pub get

# flutter doctor

cd ios

# pod install --verbose

# flutter build ios --no-pub integration_test/custom_integration_test.dart

# cd ios

xcodebuild -workspace Runner.xcworkspace \
-derivedDataPath build \
-scheme Runner \
-sdk iphoneos build-for-testing 

# CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED="NO" CODE_SIGN_ENTITLEMENTS="" CODE_SIGNING_ALLOWED="NO"

ls build/Build/Products