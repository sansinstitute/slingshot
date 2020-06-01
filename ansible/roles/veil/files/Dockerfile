# Dockerfile for Veil–Framework (https://www.veil-framework.com)
FROM fedora

RUN dnf -y update && dnf -y install git which sudo python3-crypto unzip xorg-x11-server-Xvfb ruby && dnf clean all

# Install Metasploit
RUN curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > /usr/local/bin/msfinstall
RUN chmod +x /usr/local/bin/msfinstall
RUN msfinstall

# Install Veil
RUN git clone https://github.com/Veil-Framework/Veil.git
# Fix for "[ERROR]: Veil is only supported on Fedora 22 or higher!" on Fedora 28:
RUN sed -i 's|\(osmajversion=\).*|\1$osversion|' /Veil/config/setup.sh
# Use the correct package name
RUN sed -i 's|winbind|samba-winbind-clients|' /Veil/config/setup.sh
# Change MSFVENOM_PATH:
RUN sed -i 's|/usr/local/bin/|/usr/bin/|' /Veil/config/update-config.py
# Remove package msttcore-fonts-installer
RUN sed -i 's|msttcore-fonts-installer ||' /Veil/config/setup.sh
# Setup Veil
RUN cd Veil/ && xvfb-run ./config/setup.sh --force --silent

COPY veil /usr/local/bin/
CMD ["veil"]