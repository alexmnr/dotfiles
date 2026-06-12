alias gis="git status"

gic() {
  git add --all && git commit -m $@
}

update_repos() {
    # Store the starting directory
    local root_dir=$(pwd)

    # Loop through all items in the current directory
    for dir in */; do
        # Check if it's a directory and contains a .git folder
        if [ -d "$dir" ] && [ -d "$dir/.git" ]; then
            echo "--- Updating $dir ---"
            cd "$dir" || continue
            git pull
            cd "$root_dir" || exit
        fi
    done
    echo "--- All repositories processed ---"
}

status_repos() {
    # Store the starting directory
    local root_dir=$(pwd)

    # Loop through all items in the current directory
    for dir in */; do
        # Check if it's a directory and contains a .git folder
        if [ -d "$dir" ] && [ -d "$dir/.git" ]; then
            echo "--- Status on $dir ---"
            cd "$dir" || continue
            git status
            cd "$root_dir" || exit
        fi
    done
    echo "--- All repositories processed ---"
}
