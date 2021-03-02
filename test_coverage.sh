#!/bin/sh

mkdir -p artifacts

flutter analyze > artifacts/analyze_artifacts.txt  

echo "analyze done"

flutter pub global run dart_code_metrics:metrics lib --reporter=json > artifacts/code_metrics_artifacts.txt  

flutter test --coverage  && genhtml coverage/lcov.info -o coverage/html > artifacts/coverage_artifacts.txt

value="$(cat artifacts/coverage_artifacts.txt)"

substring=${value#*......: }  

codecoverage=${substring% (*}  

echo "Code coverage:" $codecoverage
