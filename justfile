
init:
    mkdir -p bin

# Build sparkplug tools
build-tools: init
    goreleaser release --snapshot --clean

publish:
    software-uploader -dir ./dist -type flow -pattern "*sparkplug-*.tar.gz"
    software-uploader -dir ./dist_tools --dry-run
