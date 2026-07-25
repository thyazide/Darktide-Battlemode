#!/bin/bash

# ==========================================================
# Warhammer 40,000: Darktide - Battle Profile Launcher
# ==========================================================


# ================= CONFIGURATION =================

GAME_DIR="<insert path to steam library>/SteamLibrary/steamapps/common/Warhammer 40,000 DARKTIDE"

BATTLE="$GAME_DIR/Battle"
MODS="$GAME_DIR/mods"

STEAM_APP_ID="1361210"

PROFILE_NAME="Battle"

# ==========================================================


# ---------- Remove old profile symlinks ----------

remove_profile_links() {

    echo "Removing old profile links..."

    find "$MODS" -maxdepth 1 -type l | while read -r LINK; do

        TARGET=$(readlink "$LINK")

        case "$TARGET" in
            *"/Battle/"*|*"/Character_management/"*)
                rm "$LINK"
                echo "Removed: $(basename "$LINK")"
                ;;
        esac

    done
}


# ---------- Create profile symlinks ----------

link_mods() {

    SOURCE="$1"

    for ITEM in "$SOURCE"/*; do

        # Handles empty directories
        [[ -e "$ITEM" ]] || continue

        NAME=$(basename "$ITEM")
        DEST="$MODS/$NAME"


        # Do not overwrite permanent mods
        if [[ -e "$DEST" && ! -L "$DEST" ]]; then
            echo "Skipping existing real file:"
            echo "  $NAME"
            continue
        fi


        ln -s "$ITEM" "$DEST"

        echo "Enabled:"
        echo "  $NAME"

    done
}


# ---------- Main ----------

echo "Loading $PROFILE_NAME profile..."

remove_profile_links

link_mods "$BATTLE"


echo "$PROFILE_NAME" > "$MODS/.active_profile"


echo
echo "Active profile:"
cat "$MODS/.active_profile"


echo
echo "Launching Darktide..."

steam "steam://rungameid/$STEAM_APP_ID"
