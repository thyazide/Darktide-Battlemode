# Purpose
Remove whole sections of the mod stack that don't need to be active all the time. If its not loaded into the game, its not taking up memory or potentially lowering your fps. 

# Compatibility

These bash scripts are for Linux, these will not work in windows. Though versions of these could be made as batch scripts. I'm barely competent at scripting and had to resort to help from chatgpt to get these made and working properly.   

# Installation

1. Make two new folders in `*/SteamLibrary/steamapps/common/Warhammer 40,000 DARKTIDE/`

	`/battle`
	`/Character_management`

	Sort all your mods, ones you want to use in matches (`/battle`) and ones you use when you manager your characters outside of matches (`/Character_management`). Mods you want always active just go into the normal mods folder. 

2. Extract the zip into the Darktide folder `*/SteamLibrary/steamapps/common/Warhammer 40,000 DARKTIDE/`
3. You'll need to edit all three .sh files using your favorite text editor. At the top of the file find:

	`GAME_DIR="<insert path to steam library>/SteamLibrary/steamapps/common/Warhammer 40,000 DARKTIDE"`

4. Edit the part of path in angle brackets to match the path to your Steam Library and remove the angle brackets. 
5. Save & exit
6. Open a terminal window then move to the  `*/SteamLibrary/steamapps/common/Warhammer 40,000 DARKTIDE/` folder then `sudo chmod +x *.sh` to make the scripts executable. 
7. Open steam 
8. Add a game 
9. Add a non-steam game 
10. Click browse 
11. Add the .sh files one at a time from the `*/SteamLibrary/steamapps/common/Warhammer 40,000 DARKTIDE/` folder.  
12. Right clicking on the new entries one at a time 
13. Click properties
14. Click on the blank icon next to the shortcut name and choose `darktide_icon.png` from the Darktide folder. 
	Optional: You can also rename the sh file inside steam to something like "Darktide - Battle Mode" etc. 

# What they do 

Run Battle_mode.sh once to add all your in-mission mods to the mods folder and launch the game. After that you can just launch Darktide the normal way until you want to update your mods (run `Update_mods.sh`), or manage your characters (`Character_management.sh`). 

- `Character_management.sh` - removes Battle_mode, symlinks in all the character management mods then launch the game. 

- `Battle_mode.sh` - removes Character_management, symlinks in all the battle mode mods then launch the game. 

- `Update_mods.sh` -  symlinks all the mods into the mods folder allowing you to update your mods by decompressing them in the mods folder, or using something like SMQ2. **None of this will be compatible with Vortex.** 

