if [ "$(uname)" == "Darwin" ]; then
    sed=gsed #brew install gnu-sed
else
    sed=sed
fi

name=$(grep -oE '^name:.*$' pubspec.yaml | $sed 's/name:[ ]*\(.*\)/\1/')
versionInfo=$(grep -oE '^version:.*$' pubspec.yaml)
versionName=$(echo $versionInfo | $sed 's/version:[ ]*\([0-9.]\+\).*/\1/')
versionCode=$(echo $versionInfo | $sed 's/version:[ ]*\([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)\(\+[0-9]*\)\?.*/1000000*\1+10000*\2+100*\3\4/')
versionCode=$((versionCode))
buildTime=$(date +%m%d%H%M)

echo versionName:$versionName
echo versionCode:$versionCode

case "$1" in
    build_runner)
        dart run build_runner build --delete-conflicting-outputs
        ;;
    analyze)
        flutter analyze lib
        ;;
    *)
        echo "Normal  Usage: $0 help|build_runner|analyze"
esac

exit 0
