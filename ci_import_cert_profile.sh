cd ios

security add-certificates AppleWWDRCAG3.cer

security import apple_developement_certificate.p12 -P bbii -T /usr/bin/codesign

mkdir -p "$HOME/Library/MobileDevice/Provisioning Profiles"

uuid=`grep UUID -A1 -a adhoc.mobileprovision | grep -io "[-A-F0-9]\{36\}"`
cp "adhoc.mobileprovision" "$HOME/Library/MobileDevice/Provisioning Profiles/$uuid.mobileprovision"
