#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)"
BUILD_DIR="${IOS_BUILD_DIR:-$PROJECT_ROOT/build/ios}"
CONFIGURATION="${IOS_CONFIGURATION:-Release}"
VERSION_NAME="${IOS_VERSION_NAME:-0.0.0}"
BUILD_NUMBER="${IOS_BUILD_NUMBER:-1}"
BUNDLE_IDENTIFIER="${IOS_BUNDLE_IDENTIFIER:-com.lightwinder.yosuganosora.hdremake}"
CODE_SIGN_IDENTITY="${IOS_CODE_SIGN_IDENTITY:-}"
DEVELOPMENT_TEAM="${IOS_DEVELOPMENT_TEAM:-}"
PROVISIONING_PROFILE="${IOS_PROVISIONING_PROFILE:-}"

if [[ "$(uname -s)" != "Darwin" ]]; then
	echo "The iOS project can only be generated on macOS." >&2
	exit 1
fi

if ! command -v xcodebuild >/dev/null 2>&1 ||
	! xcodebuild -version >/dev/null 2>&1; then
	echo "A full Xcode installation is required to generate the iOS project." >&2
	exit 1
fi

if ! command -v cmake >/dev/null 2>&1; then
	echo "CMake 3.24 or newer is required to generate the iOS project." >&2
	exit 1
fi

if [[ ! -f "$PROJECT_ROOT/data/startup.tjs" ]]; then
	echo "Game data is incomplete: data/startup.tjs was not found." >&2
	exit 1
fi

cmake \
	-S "$PROJECT_ROOT" \
	-B "$BUILD_DIR" \
	-G Xcode \
	-DCMAKE_SYSTEM_NAME=iOS \
	-DCMAKE_OSX_DEPLOYMENT_TARGET=13.0 \
	-DCMAKE_XCODE_ATTRIBUTE_ONLY_ACTIVE_ARCH=NO \
	-DKRKRSDL2_BUNDLE_IDENTIFIER="$BUNDLE_IDENTIFIER" \
	-DKRKRSDL2_VERSION_NAME="$VERSION_NAME" \
	-DKRKRSDL2_BUILD_NUMBER="$BUILD_NUMBER" \
	-DKRKRSDL2_IOS_CODE_SIGN_IDENTITY="$CODE_SIGN_IDENTITY" \
	-DKRKRSDL2_IOS_DEVELOPMENT_TEAM="$DEVELOPMENT_TEAM" \
	-DKRKRSDL2_IOS_PROVISIONING_PROFILE="$PROVISIONING_PROFILE" \
	-DKRKRSDL2_GENERATE_CONTENT_MANIFEST=ON \
	-DOPTION_ENABLE_EXTERNAL_PLUGINS=OFF

echo "Generated: $BUILD_DIR/krkrsdl2.xcodeproj"
echo "Build without launching:"
echo "  cmake --build '$BUILD_DIR' --config '$CONFIGURATION' --target krkrsdl2 --parallel"
echo "To run on a device, open the project in Xcode and select your Development Team."
