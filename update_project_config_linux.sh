#!/bin/bash

# Script to update the Xcode project configuration for modern iOS support (Linux-compatible)

echo "Updating project configuration for modern iOS versions..."

# Create backup of original project file
cp NineAnimator.xcodeproj/project.pbxproj NineAnimator.xcodeproj/project.pbxproj.backup

echo "Created backup of project file"

# Update IPHONEOS_DEPLOYMENT_TARGET from 13.0 to 15.0 (Linux-compatible sed)
sed -i 's/IPHONEOS_DEPLOYMENT_TARGET = 13.0;/IPHONEOS_DEPLOYMENT_TARGET = 15.0;/g' NineAnimator.xcodeproj/project.pbxproj
sed -i 's/IPHONEOS_DEPLOYMENT_TARGET = 13.2;/IPHONEOS_DEPLOYMENT_TARGET = 15.0;/g' NineAnimator.xcodeproj/project.pbxproj

# Update macOS deployment target for MacCatalyst
sed -i 's/"IPHONEOS_DEPLOYMENT_TARGET\[sdk=macosx*\]" = 14.2;/"IPHONEOS_DEPLOYMENT_TARGET\[sdk=macosx*\]" = 12.0;/g' NineAnimator.xcodeproj/project.pbxproj

# Update Swift version to 5.7 (or higher)
sed -i 's/SWIFT_VERSION = 5.0;/SWIFT_VERSION = 5.7;/g' NineAnimator.xcodeproj/project.pbxproj

echo "Updated deployment targets and Swift version"

# Update Info.plist with modern values
INFO_PLIST="NineAnimator/Info.plist"

if [ -f "$INFO_PLIST" ]; then
    cp "$INFO_PLIST" "$INFO_PLIST.backup"
    
    # Add modern plist entries if they don't exist (Linux-compatible)
    if ! grep -q "LSMinimumSystemVersion" "$INFO_PLIST"; then
        # Insert before the closing </dict> tag
        sed -i '/<\/dict>/i\
        <key>LSMinimumSystemVersion<\/key>\
        <string>15.0<\/string>' "$INFO_PLIST"
    fi
    
    echo "Updated Info.plist with modern system requirements"
else
    echo "Warning: Info.plist not found at expected location"
fi

echo "Project configuration update completed!"
echo "Backup saved as NineAnimator.xcodeproj/project.pbxproj.backup"