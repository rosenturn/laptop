#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos

dnf5 -y remove firefox # instead install flathub version

dnf5 -y group install --with-optional virtualization
dnf5 -y install xcb-util-cursor # fix amnezia vpn work
dnf5 -y install android-tools
dnf5 -y install rpm-build rpmrebuild
dnf5 -y install wireshark

rpm --import https://packages.microsoft.com/keys/microsoft.asc &&
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf5 -y install code

dnf5 -y copr enable matinlotfali/KDE-Rounded-Corners
dnf5 -y install kwin-effect-roundcorners
dnf5 -y copr disable matinlotfali/KDE-Rounded-Corners

dnf5 -y copr enable deltacopy/darkly 
dnf5 -y install darkly
dnf5 -y copr disable deltacopy/darkly 

# dnf5 -y install niri

# dnf5 -y install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
# dnf5 -y install noctalia-shell

# dnf5 -y install noctalia

dnf -y install steam gamescope

#### Example for enabling a System Unit File

systemctl enable podman.socket
