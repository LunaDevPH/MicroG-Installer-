# config.sh
MODPATH=${0%/*}
MODDIR=$MODPATH
SYS_PATH=$MODPATH/system

# Function to recursively mount files from modpath/system to /system
mount_system() {
    local src_dir="$1"
    local dest_dir="$2"
    
    for item in "$src_dir"/*; do
        if [ -d "$item" ]; then
            # If it's a directory, create the same directory in /system and mount recursively
            mkdir -p "$dest_dir/$(basename "$item")"
            mount_system "$item" "$dest_dir/$(basename "$item")"
        elif [ -f "$item" ]; then
            # If it's a file, mount it to the same location in /system
            mount --bind "$item" "$dest_dir/$(basename "$item")"
        fi
    done
}

# Call the mount_system function to recursively mount everything
mount_system "$SYS_PATH" "/system"