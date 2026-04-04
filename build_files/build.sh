#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos

# dnf5 -y check-update

# this installs a package from fedora repos 

#dnf5 -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
#dnf5 -y config-manager setopt fedora-cisco-openh264.enabled=1


dnf5 -y remove firefox # instead install flathub version

# dnf5 -y copr enable deltacopy/darkly
# dnf5 -y install darkly
# dnf5 -y copr disable deltacopy/darkly

dnf5 -y copr enable matinlotfali/KDE-Rounded-Corners
dnf5 -y install kwin-effect-roundcorners
dnf5 -y copr disable matinlotfali/KDE-Rounded-Corners

dnf5 -y group install --with-optional virtualization

# dnf5 -y install VirtualBox

#dnf5 -y install xcb-util-cursor # fix amnezia vpn work
#dnf5 -y install adw-gtk3-theme # fix gtk3 with libadwaita
dnf5 -y install wireshark

dnf5 -y install steam

tee -a /etc/yum.repos.d/vscodium.repo << 'EOF'
[gitlab.com_paulcarroty_vscodium_repo]
name=gitlab.com_paulcarroty_vscodium_repo
baseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg
metadata_expire=1h
EOF

dnf5 -y install codium

#rpm --import https://packages.microsoft.com/keys/microsoft.asc &&
#echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
#dnf5 -y install code

# dnf5 -y install curl cabextract xorg-x11-font-utils fontconfig

# rpm --nodigest -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

# fc-cache -fv


# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
