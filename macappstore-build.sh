#!/bin/bash

APP_CERTIFICATE="Apple Distribution: Bojin Li (7N7Y43VZ4J)"
PKG_CERTIFICATE="3rd Party Mac Developer Installer: Bojin Li (7N7Y43VZ4J)"
APP_NAME="NatDetectionGUI"

wails build -platform darwin/universal -clean

cp ./embedded.provisionprofile "./build/bin/$APP_NAME.app/Contents"

codesign --timestamp --options=runtime -s "$APP_CERTIFICATE" -v --entitlements ./build/darwin/entitlements.plist ./build/bin/$APP_NAME.app

productbuild --sign "$PKG_CERTIFICATE" --component ./build/bin/$APP_NAME.app /Applications ./$APP_NAME.pkg