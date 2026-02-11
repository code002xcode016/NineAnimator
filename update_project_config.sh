#!/bin/bash

# Script to update the Xcode project configuration for modern iOS support

echo "Updating project configuration for modern iOS versions..."

# Create backup of original project file
cp NineAnimator.xcodeproj/project.pbxproj NineAnimator.xcodeproj/project.pbxproj.backup

echo "Created backup of project file"

# Update IPHONEOS_DEPLOYMENT_TARGET from 13.0 to 15.0
sed -i '' 's/IPHONEOS_DEPLOYMENT_TARGET = 13.0;/IPHONEOS_DEPLOYMENT_TARGET = 15.0;/g' NineAnimator.xcodeproj/project.pbxproj
sed -i '' 's/IPHONEOS_DEPLOYMENT_TARGET = 13.2;/IPHONEOS_DEPLOYMENT_TARGET = 15.0;/g' NineAnimator.xcodeproj/project.pbxproj

# Update macOS deployment target for MacCatalyst
sed -i '' 's/"IPHONEOS_DEPLOYMENT_TARGET\[sdk=macosx\*\]" = 14.2;/"IPHONEOS_DEPLOYMENT_TARGET\[sdk=macosx\*\]" = 12.0;/g' NineAnimator.xcodeproj/project.pbxproj

# Update Swift version to 5.7 (or higher)
sed -i '' 's/SWIFT_VERSION = 5.0;/SWIFT_VERSION = 5.7;/g' NineAnimator.xcodeproj/project.pbxproj

echo "Updated deployment targets and Swift version"

# Add modern build settings
echo "Adding modern build settings..."

# Use a temporary file for complex sed operations
TEMP_FILE=$(mktemp)

awk '
BEGIN { in_section = 0 }
/^.*buildSettings.*=$/ { 
    in_section = 1
    print $0
    next
}
in_section && /^[[:space:]]*};$/ { 
    # Add modern build settings before closing brace
    print "                                CLANG_ENABLE_OBJC_WEAK = YES;"
    print "                                ENABLE_DEFAULT_HEADER_SEARCH_PATHS = NO;"
    print "                                ENABLE_MODULES = YES;"
    print "                                ENABLE_TESTABILITY = YES;"
    print "                                GCC_WARN_ABOUT_MISSING_PROTOTYPES = YES;"
    print "                                GCC_WARN_UNDECLARED_SELECTOR = YES;"
    print "                                GCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;"
    print "                                GCC_WARN_UNUSED_FUNCTION = YES;"
    print "                                GCC_WARN_UNUSED_VARIABLE = YES;"
    print "                                MTL_FAST_MATH = YES;"
    print "                                SDKROOT = iphoneos;"
    print "                                SKIP_INSTALL = NO;"
    print "                                SUPPORTS_MACCATALYST = YES;"
    print "                                SUPPORTS_XR_OS = NO;"
    print "                                SWIFT_ACTIVE_COMPILATION_CONDITIONS = $(inherited);"
    print "                                SWIFT_COMPILATION_MODE = wholemodule;"
    print "                                SWIFT_OPTIMIZATION_LEVEL = -O;"
    print "                                TARGETED_DEVICE_FAMILY = \"1,2\";"
    print $0
    in_section = 0
    next
}
{ print $0 }
' NineAnimator.xcodeproj/project.pbxproj > "$TEMP_FILE" && mv "$TEMP_FILE" NineAnimator.xcodeproj/project.pbxproj

echo "Added modern build settings"

# Update Info.plist with modern values
INFO_PLIST="NineAnimator/Info.plist"

if [ -f "$INFO_PLIST" ]; then
    cp "$INFO_PLIST" "$INFO_PLIST.backup"
    
    # Add modern plist entries if they don't exist
    grep -q "LSMinimumSystemVersion" "$INFO_PLIST" || sed -i '' '/<\/dict>/i\
	<key>LSMinimumSystemVersion</key>\
	<string>15.0</string>' "$INFO_PLIST"
    
    echo "Updated Info.plist with modern system requirements"
else
    echo "Warning: Info.plist not found at expected location"
fi

echo "Project configuration update completed!"
echo "Backup saved as NineAnimator.xcodeproj/project.pbxproj.backup"