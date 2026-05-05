
init:
    mkdir -p bin

# build sparkplug tools
build-tools: init
    goreleaser release --snapshot --clean

# build flows
build-flows:
    npm run build-all
    npm run publish

# build all artifacts
build: (build-flows) (build-tools)

# publish flows to Cumulocity repository
publish-flows *args="": build-flows
    software-uploader -dir ./dist -type flow -pattern "*sparkplug-*.tar.gz" {{args}}

# publish tools to Cumulocity repository
publish-tools *args="": build-tools
    software-uploader -dir ./dist_tools --pattern "*.deb" {{args}}
    software-uploader -dir ./dist_tools --pattern "*.rpm" {{args}}
    software-uploader -dir ./dist_tools --pattern "*.apk" {{args}}

# publish all artifacts to Cumulocity repository
publish: (publish-flows) (publish-tools)
