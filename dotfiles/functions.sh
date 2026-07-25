mkcd() {
    mkdir -p "$1"
    cd "$1"
}

extract() {
    case "$1" in
        *.zip) unzip "$1" ;;
        *.tar.gz) tar -xzf "$1" ;;
        *.tar.xz) tar -xJf "$1" ;;
        *) echo "Formato não suportado." ;;
    esac
}
