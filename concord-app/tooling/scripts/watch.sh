for directory in $1/*; do
    if [ -d "$directory" ]; then
        cd "$directory" && fvm flutter pub run build_runner watch --delete-conflicting-outputs &
    fi
done
