mkcd() {
    mkdir -p "$1"
    cd "$1"
}

extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2) tar xjf "$1" ;;
            *.tar.gz)  tar xzf "$1" ;;
            *.tar.xz)  tar xJf "$1" ;;
            *.tar)     tar xf "$1" ;;
            *.zip)     unzip "$1" ;;
            *.gz)      gunzip "$1" ;;
            *.bz2)     bunzip2 "$1" ;;
            *)         echo "Unsupported archive format: $1" ;;
        esac
    else
        echo "File not found: $1"
    fi
}

croot() {
    cd "$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
}
