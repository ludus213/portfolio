@echo off
echo Building the APK...
call gradlew.bat assembleDebug
echo APK built successfully!
echo You can find the APK in app/build/outputs/apk/debug/app-debug.apk
pause
