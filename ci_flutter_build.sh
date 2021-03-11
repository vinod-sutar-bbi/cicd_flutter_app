# flutter clean

# flutter build ios integration_test/custom_integration_test.dart

# cd ios

# xcodebuild -workspace Runner.xcworkspace \
# -derivedDataPath build \
# -scheme Runner \
# -sdk iphoneos build-for-testing

flutter clean

pushd android

flutter build apk
./gradlew app:assembleAndroidTest
./gradlew app:assembleDebug -Ptarget=integration_test/custom_integration_test.dart
popd

gcloud firebase test android run \
  --type robo \
  --app build/app/outputs/flutter-apk/app-release.apk \
  --device model=Nexus6,version=21,locale=en,orientation=portrait  \
  --device model=Nexus7,version=19,locale=fr,orientation=landscape \
  --timeout 90s
