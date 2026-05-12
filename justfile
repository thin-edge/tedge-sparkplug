
# build flows
build-flows:
    npm run build-all
    npm run publish

# build all artifacts
build: (build-flows)

# publish flows to Cumulocity repository
publish-flows *args="": build-flows
    software-uploader -dir ./dist -type flow -pattern "*sparkplug-*.tar.gz" {{args}}

# publish all artifacts to Cumulocity repository
publish: (publish-flows)
