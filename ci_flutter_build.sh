flutter clean

rm ios/Podfile.lock

# flutter build ios integration_test/custom_integration_test.dart --no-pub

flutter pub get

flutter build ios --no-pub integration_test/custom_integration_test.dart

# cd ios

# xcodebuild -workspace Runner.xcworkspace \
# -derivedDataPath build \
# -scheme Runner \
# -sdk iphoneos build-for-testing
