#!/usr/bin/env bats

setup() {
    TEST_DIR="$(mktemp -d)"
    export TEST_DIR
    export HOME="$TEST_DIR/home"
    mkdir -p "$HOME"

    # Put mock commands ahead of system PATH
    MOCK_BIN="$TEST_DIR/bin"
    mkdir -p "$MOCK_BIN"
    export PATH="$MOCK_BIN:$PATH"

    # Default mock uname reports macOS x86_64
    cat > "$MOCK_BIN/uname" <<'EOF'
#!/bin/sh
case "$1" in
    -s) echo "Darwin" ;;
    -m) echo "x86_64" ;;
    *) echo "unknown" ;;
esac
EOF
    chmod +x "$MOCK_BIN/uname"

    # Mock curl: returns a fake latest release JSON, or writes a minimal zip
    cat > "$MOCK_BIN/curl" <<'EOF'
#!/bin/sh
OUTPUT=""
URL=""
while [ $# -gt 0 ]; do
    case "$1" in
        -o) shift; OUTPUT="$1" ;;
        -*) ;;
        *) URL="$1" ;;
    esac
    shift
done

if echo "$URL" | grep -q "releases/latest"; then
    echo '{"tag_name":"v0.0.10"}'
    exit 0
fi

if echo "$URL" | grep -q "/download/"; then
    python3 - "$OUTPUT" <<'PY'
import sys, zipfile, os
out = sys.argv[1]
with zipfile.ZipFile(out, 'w') as z:
    z.writestr('wukong', '#!/bin/sh\necho "wukong stub"\n')
os.chmod(out, 0o644)
PY
    exit 0
fi

exit 1
EOF
    chmod +x "$MOCK_BIN/curl"
}

teardown() {
    rm -rf "$TEST_DIR"
}

@test "installs the latest release by default" {
    run ./install.sh
    [ "$status" -eq 0 ]
    [ -x "$HOME/.wukong/bin/wukong" ]
    [[ "$output" == *"v0.0.10"* ]]
    [[ "$output" == *"wukong-darwin-x64"* ]]
}

@test "respects WUKONG_VERSION override" {
    WUKONG_VERSION=v0.0.7 run ./install.sh
    [ "$status" -eq 0 ]
    [[ "$output" == *"v0.0.7"* ]]
    [ -x "$HOME/.wukong/bin/wukong" ]
}

@test "respects WUKONG_INSTALL_DIR override" {
    CUSTOM_DIR="$TEST_DIR/custom/bin"
    export WUKONG_INSTALL_DIR="$CUSTOM_DIR"
    run ./install.sh
    [ "$status" -eq 0 ]
    [ -x "$CUSTOM_DIR/wukong" ]
}

@test "fails on unsupported platform" {
    cat > "$MOCK_BIN/uname" <<'EOF'
#!/bin/sh
case "$1" in
    -s) echo "FreeBSD" ;;
    -m) echo "x86_64" ;;
esac
EOF
    chmod +x "$MOCK_BIN/uname"

    run ./install.sh
    [ "$status" -eq 1 ]
    [[ "$output" == *"Unsupported platform"* ]]
}

@test "fails on unsupported architecture" {
    cat > "$MOCK_BIN/uname" <<'EOF'
#!/bin/sh
case "$1" in
    -s) echo "Darwin" ;;
    -m) echo "riscv64" ;;
esac
EOF
    chmod +x "$MOCK_BIN/uname"

    run ./install.sh
    [ "$status" -eq 1 ]
    [[ "$output" == *"Unsupported architecture"* ]]
}

@test "prints PATH hint when install dir is not on PATH" {
    export PATH="/usr/bin:/bin"
    run ./install.sh
    [ "$status" -eq 0 ]
    [[ "$output" == *"Add the following to your shell profile"* ]]
}

@test "does not print PATH hint when install dir is already on PATH" {
    export PATH="$HOME/.wukong/bin:/usr/bin:/bin"
    run ./install.sh
    [ "$status" -eq 0 ]
    [[ "$output" != *"Add the following to your shell profile"* ]]
}
