cd ios

security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain AppleWWDRCAG3.cer

security add-certificates AppleWWDRCAG3.cer

security import apple_developement_certificate.p12 -P bbii -T /usr/bin/codesign -A

mkdir -p "$HOME/Library/MobileDevice/Provisioning Profiles"

uuid=`grep UUID -A1 -a adhoc.mobileprovision | grep -io "[-A-F0-9]\{36\}"`
cp "adhoc.mobileprovision" "$HOME/Library/MobileDevice/Provisioning Profiles/$uuid.mobileprovision"
