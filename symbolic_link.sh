IGNORE_DIRS="^\.git"

echo "Create dotfile links"
for dotfile in .??*; do
    [[ $dotfile =~ $IGNORE_DIRS ]] && continue
    ln -snfv "$(pwd)/$dotfile" "$HOME"/"$dotfile"
done

echo "Create config links"
mkdir -p "$HOME"/.config
for dotfile in "$(ls .config)"; do
    [[ $dotfile =~ $IGNORE_DIRS ]] && continue
    ln -snfv "$(pwd)/$config" "$HOME"/.config/"${config##*/}"
done

echo "Create config links"
