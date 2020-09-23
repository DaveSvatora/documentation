---
title: "LinuxSoftware"
date: 2019-04-06T13:08:27-05:00
draft: false
tags: ["linux", "apt", "docker", "gradle", "nodejs", "spotify", "pop_!os"]
---

`Pop!_OS` has a built in software distribution gui called the `Pop!_Shop`. In this guide we'll start off by installing some common software one might use on a linux machine for general use. Like most built in software management gui's on Linux there is some software available, but its hit or miss. After the easy installs we'll add in more using `apt`.

Lets start off with easy installs from the **Pop!_Shop**

---

### Pop!_Shop

To open the pop!_shop hit the Super key (windows key depending on your keyboard) and type `pop`. You should see the pop shop in your list of applications, open it up and lets start installing all of these great `free` software

- **Chromium** *Note: Grab the Bitwarden Extension and Material Dark theme*
- **Spotify**
- **VS Code**
- **Telegram**
- **PGAdmin III** (Postgresql)
- **VLC Media Player**
- **KDE Connect**

---

### Setting up my HP Printer

- Plug in printer
- Turn On printer
- It should automatically configure itself

---

> Time to Fire up the terminal and do some real damage!

### Firefox Removal

- Uninstall firefox browser
```
sudo apt purge firefox
```

- Remove Hidden folder
```
rm -rf ~/.mozilla
```

- Remove root folders
```
rm -rf /usr/lib/firefox-addons/
rm -rf /usr/lib/firefox
```

---

### Docker

See the [Docker Site](https://docs.docker.com/v17.09/engine/installation/linux/docker-ce/ubuntu/#install-using-the-repository) for the most recent instructions

- Update
```
sudo apt-get update
```

- Add Repo
```
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
```

- Add GPG key
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

- Fingerprint
```
sudo apt-key fingerprint 0EBFCD88
```

- Add Repo
```
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

- Install
```
sudo apt-get install docker-ce
```

#### Allow docker to run without sudo

[Guide](https://docs.docker.com/v17.09/engine/installation/linux/linux-postinstall/)

- Create docker group
```
sudo groupadd docker
```

- Add your user to the docker group
```
sudo usermod -aG docker $USER
```

**REBOOT** your machine

---

### Java

[Guide](https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-18-04)

- Update
```
sudo apt update
```

- Check if java is installed
```
java -version
```

- Install OpenJDK
```
sudo apt install default-jdk
```

- Verify
```
javac -version
```

---

### Gradle

[Guide](https://gradle.org/install/)

[Download](https://gradle.org/releases)

- Unzip the distribution zip file in the directory of your choosing
```
mkdir /opt/gradle
unzip -d /opt/gradle ~/Downloads/gradle-5.2.1-bin.zip
ls /opt/gradle/gradle-5.2.1
```

- Update `~/.profile`
```
code ~/.profile
```

- Add gradle to the path
```
export GRADLE=/opt/gradle/gradle-5.2.1/bin
export PATH=$PATH:$GRADLE
```

- Test *Note: Reboot may be required*
```
gradle
```

---

### NVM (Nodejs and NPM)

[Guide](https://github.com/creationix/nvm#installation-and-update)

- Install
```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
```

- Verify install
```
command -v nvm
```

- Install LTS
```
nvm install --lts
```

- Verify Node and npm are installed
```
node -v
npm -v
```
---

### Setup Git

Git should be installed by default

[Gitlab]()

Generate key
```
ssh-keygen -t ed25519 -C <email>
```

Copy public key to gitlab.com
```
code ~/.ssh/id_ed25519.pub
```

Create a development directory and clone a project
```
mkdir dev
cd dev
git clone git@github.com:DaveSvatora/documentation.git
```
---

### Runner
### Draw.io

---

## Make Windows 10 Install USB on Pop!_OS

[Guide](https://itsfoss.com/bootable-windows-usb-linux/)

### Download Windows 10 iso


### Install WoeUSB
```
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt update
sudo apt install woeusb
```

### Format USB

Right click usb, choose `Format...`

Choose NTFS

```
sudo woeusb --device ~/Downloads/Win10_1809Oct_English_x64.iso /dev/sdd --target-device NTFS
```

Select Downloaded ISO

---

## Hugo

Install snapd first

```
sudo apt install snapd
```

Install hugo as a snap

```
snap install hugo --channel=extended
```
