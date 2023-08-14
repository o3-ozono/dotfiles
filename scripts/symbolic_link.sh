echo "backup old dotfiles..."
if [ ! -d "$HOME/.dotbackup" ];then
    echo "$HOME/.dotbackup not found. Auto Make it"
    mkdir "$HOME/.dotbackup"
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
dotdir=$(dirname ${script_dir})

if [[ "$HOME" != "$dotdir" ]];then
    for f in $dotdir/.??*; do
        [[ `basename $f` == ".git" ]] && continue
        if [[ -L "$HOME/`basename $f`" ]];then
            rm -f "$HOME/`basename $f`"
        fi
        if [[ -e "$HOME/`basename $f`" ]];then
            mv "$HOME/`basename $f`" "$HOME/.dotbackup"
        fi
            ln -snf $f $HOME
            echo "link $f to $HOME"
    done
else
    echo "same install src dest"
fi
