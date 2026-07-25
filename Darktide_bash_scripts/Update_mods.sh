#!/bin/bash

# ==========================================================
# Darktide Mod Link Maintenance Tool
# ==========================================================


# ================= CONFIGURATION =================

GAME_DIR="<insert path to steam library>/steamapps/common/Warhammer 40,000 DARKTIDE"

BATTLE="$GAME_DIR/Battle"
CHARACTER="$GAME_DIR/Character_management"
MODS="$GAME_DIR/mods"

PROFILE_FILE="$MODS/.active_profile"

# ==========================================================


echo "================================="
echo "Darktide Mod Link Update"
echo "================================="


if [[ -f "$PROFILE_FILE" ]]; then
    echo "Current profile:"
    cat "$PROFILE_FILE"
else
    echo "No active profile detected."
fi


echo


link_all_mods() {

    SOURCE="$1"

    for ITEM in "$SOURCE"/*; do

        [[ -e "$ITEM" ]] || continue

        NAME=$(basename "$ITEM")
        DEST="$MODS/$NAME"


        if [[ -e "$DEST" ]]; then
            echo "Already exists:"
            echo "  $NAME"
            continue
        fi


        ln -s "$ITEM" "$DEST"

        echo "Linked:"
        echo "  $NAME"

    done
}


echo "Adding Battle mods..."
link_all_mods "$BATTLE"


echo
echo "Adding Character Management mods..."
link_all_mods "$CHARACTER"


echo
echo "Finished updating mod links."
