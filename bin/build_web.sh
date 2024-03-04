#!/bin/bash
PROJECT_ROOT=${HOME}/git/bluespoiler
cd ${PROJECT_ROOT}
flutter pub get
dart run build_runner build
flutter build web --base-href=/bluespoiler/
cp -rf ${PROJECT_ROOT}/build/web/* ${PROJECT_ROOT}/docs/.
