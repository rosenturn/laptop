#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos

#rpm --import https://packages.microsoft.com/keys/microsoft.asc &&
#echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

# dnf5 -y check-update

# this installs a package from fedora repos 

dnf5 copr enable deltacopy/darkly
dnf5 -y install darkly
dnf5 copr disable deltacopy/darkly

dnf5 copr enable matinlotfali/KDE-Rounded-Corners
dnf5 -y install kwin-effect-roundcorners
dnf5 copr disable matinlotfali/KDE-Rounded-Corners

dnf5 -y group install --with-optional virtualization

#dnf5 -y install xcb-util-cursor # fix amnezia vpn work
dnf5 -y install adw-gtk3-theme # fix gtk3 with libadwaita
dnf5 -y install wireshark

dnf5 -y remove firefox # instead install flathub version

# dnf5 -y install code

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
