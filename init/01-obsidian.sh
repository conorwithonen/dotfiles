# NOTE: This script does not actually open the folder in the application AS a vault.
# 	it sets everything up so that when obsidian reads it as a vault, it will have hotkeys,
# 	themes, etc... but you still need to go into Obsidian and "Open folder as new vault." 


VAULT_NAME='Notes' 
VAULT_PATH="$HOME"
OBSIDIAN_PATH="$VAULT_PATH/$VAULT_NAME"
OBSIDIAN_CONFIGS="${DOTFILES}/config/.obsidian"

# Folders to create in Obsidian
# Manual notes
DIRS=()
DIRS+=('01 - Projects')
DIRS+=('02 - Area')
DIRS+=('03 - Resources')
DIRS+=('04 - Archive')
#
# Dynamic note directories
DIRS+=('_assets')
DIRS+=('_daily')
DIRS+=('_templates')
DIRS+=('_templates')
DIRS+=('Intake')


# build vault structure
echo "Creating $OBSIDIAN_PATH"
mkdir "$OBSIDIAN_PATH"

for dir in "${DIRS[@]}";do
	fullpath="$OBSIDIAN_PATH/$dir"
	echo "Creating $fullpath";
	mkdir -p "$fullpath"
done

# Copy over config files to new note vault
rsync --exclude "bookmarks.json" \
	--exclude "workspace.json" \
	-vah --no-t "$OBSIDIAN_CONFIGS" "$OBSIDIAN_PATH"

echo "Obsidian path has been configured at $OBSIDIAN_PATH"
