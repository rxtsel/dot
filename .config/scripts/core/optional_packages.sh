install_dev_utils() {
	read -p "Do you want to install utils for development? [Y/n]: " dev_utils_choice
	dev_utils_choice=${dev_utils_choice:-Y} # Default choice is Y if user presses Enter

	if [ "$dev_utils_choice" = "Y" ] || [ "$dev_utils_choice" = "y" ]; then
		# Commands to install utils for development
		echo "Installing utils for development..."
		curl -fsSL https://fnm.vercel.app/install | zsh &&
			export PATH="/home/rxtsel/.local/share/fnm:$PATH"
		eval "$(fnm env)"

		source ~/.zshrc &&
			fnm install v20 &&
			soure ~/.zshrc &&
			npm i -g @antfu/ni commitizen cz-conventional-changelog &&
			echo '{ "path": "cz-conventional-changelog" }' >~/.czrc
	else
		echo "Skipping installation of utils for development."
	fi
}

install_display_manager() {
	read -p "Do you want to install display manager? [Y/n]: " display_manager_choice
	display_manager_choice=${display_manager_choice:-Y} # Default choice is Y if user presses Enter

	if [ "$display_manager_choice" = "Y" ] || [ "$display_manager_choice" = "y" ]; then
		# Commands to install display manager
		echo "Installing display manager..."
		sudo pacman -S --noconfirm greetd-tuigreet &&
			sudo systemctl enable greetd.service &&
			sudo rm /etc/greetd/config.toml &&
			sudo ln -s ~/dot/custom/tuigreet/config.toml /etc/greetd/
	else
		echo "Skipping installation of display manager."
	fi
}

install_refind() {
	read -p "Do you want to install rEFInd? [Y/n]: " refind_choice
	refind_choice=${refind_choice:-Y} # Default choice is Y if user presses Enter

	# Vars
	resolution=$(xrandr | awk '/\*/ {gsub(/x/, " ", $1); print $1}') # output example: 1920 1080
	root_part_uuid=$(lsblk -no PARTUUID $(findmnt -n -o SOURCE /))

	if [ "$refind_choice" = "Y" ] || [ "$refind_choice" = "y" ]; then
		# Commands to install rEFInd
		echo "Installing rEFInd..."
		sudo pacman -S --noconfirm refind && refind-install &&
			# Verify if GRUB is installed and remove it if necessary
			if [ -d "/boot/EFI/grub" ]; then
				echo "GRUB found. Removing GRUB..."
				sudo pacman -Rns grub --noconfirm
				sudo rm -r /boot/EFI/grub
				echo "GRUB deleted."
			else
				echo "GRUB not found. Search other bootloaders to remove."
			fi

		# Verify if systemd-boot is installed and remove it if necessary
		if [ -d "/boot/EFI/systemd" ]; then
			echo "systemd-boot found. Removing systemd-boot..."
			sudo bootctl remove
			echo "systemd-boot deleted."
		else
			echo "systemd-boot not found. Installing rEFInd..."
		fi

		# Setting up rEFInd
		echo "Copying rEFInd theme..."
		sudo cp -r ~/dot/custom/refind/themes/ /boot/EFI/refind/ &&
			sudo cp ~/dot/custom/refind/refind.conf /boot/EFI/refind/ &&
			echo "Add your resolution into refind.conf" &&
			sudo sed -i "s/^.*resolution.*/resolution $resolution/g" /boot/EFI/refind/refind.conf
		echo "Add your root PARTUUID into refind.conf" &&
			sudo sed -i "s/root=PARTUUID=[^ ]*/root=PARTUUID=$root_part_uuid/g" /boot/EFI/refind/refind.conf
	else
		echo "Skipping installation of rEFInd."
	fi
}
