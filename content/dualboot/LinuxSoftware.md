---
title: "LinuxSoftware"
date: 2019-04-06T13:08:27-05:00
draft: false
---

`Pop!_OS` has a built in software distribution gui called the `Pop!_Shop`. In this guide we'll start off by installing some common software one might use on a linux machine for general use. Like most built in software management gui's on Linux there is some software available, but its hit or miss. After the easy installs we'll add in more using `apt`.

Lets start off with easy installs from the **Pop!_Shop**

> Pop!_Shop

#### Chromium

- Go to the **Pop!_Shop**
- Search for `Chromium`
- Install `Chromium`

*Note: Grab the Bitwarden Extension and Material Dark theme*

---

#### Spotify

- Go to the **POP!_Shop**
- Search for `Spotify`
- Install `Spotify`

Setup account

---

#### VS Code

- Go to the **POP!_Shop**
- Search for `Visual Studio Code`
- Install `Visual Studio Code`

---

#### Telegram

- Go to the **POP!_Shop**
- Search for `Telegram`
- Install `Telegram`

---

#### PGAdmin III

- Go to the **POP!_Shop**
- Search for `PGAdmin III`
- Install `PGAdmin III`

---

#### VLC Media Player

- Go to the **POP!_Shop**
- Search for `VLC Media Player`
- Install `VLC Media Player`

---

#### KDE Connect

- Go to the **POP!_Shop**
- Search for `KDE Connect`
- Install `KDE Connect`

---

#### Printer

- Plug in printer
- Turn On printer
- It should automatically configure itself

---

> Time to Fire up the terminal!

> ## Firefox Removal

- Uninstall firefox browser
{{< highlight bash >}}
sudo apt purge firefox
{{< / highlight >}}

- Remove Hidden folder
{{< highlight bash >}}
rm -rf ~/.mozilla
{{< / highlight >}}

- Remove root folders
{{< highlight bash >}}
rm -rf /usr/lib/firefox-addons/
rm -rf /usr/lib/firefox
{{< / highlight >}}

---

> ## Docker

See the [Docker Site](https://docs.docker.com/v17.09/engine/installation/linux/docker-ce/ubuntu/#install-using-the-repository) for the most recent instructions

- Update
{{< highlight bash >}}
sudo apt-get update
{{< / highlight >}}

- Add Repo
{{< highlight bash >}}
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
{{< / highlight >}}

- Add GPG key
{{< highlight bash >}}
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
{{< / highlight >}}

- Fingerprint
{{< highlight bash >}}
sudo apt-key fingerprint 0EBFCD88
{{< / highlight >}}

- Add Repo
{{< highlight bash >}}
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
{{< / highlight >}}

- Install
{{< highlight bash >}}
sudo apt-get install docker-ce
{{< / highlight >}}

#### Allow docker to run without sudo

[Guide](https://docs.docker.com/v17.09/engine/installation/linux/linux-postinstall/)

- Create docker group
{{< highlight bash >}}
sudo groupadd docker
{{< / highlight >}}

- Add your user to the docker group
{{< highlight bash >}}
sudo usermod -aG docker $USER
{{< / highlight >}}

**REBOOT**

---

> ## Java

[Guide](https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-18-04)

- Update
{{< highlight bash >}}
sudo apt update
{{< / highlight >}}

- Check if java is installed
{{< highlight bash >}}
java -version
{{< / highlight >}}

- Install OpenJDK
{{< highlight bash >}}
sudo apt install default-jdk
{{< / highlight >}}

- Verify
{{< highlight bash >}}
javac -version
{{< / highlight >}}

> ## Gradle

[Guide](https://gradle.org/install/)

[Download](https://gradle.org/releases)

- Unzip the distribution zip file in the directory of your choosing
{{< highlight bash >}}
mkdir /opt/gradle
unzip -d /opt/gradle ~/Downloads/gradle-5.2.1-bin.zip
ls /opt/gradle/gradle-5.2.1
{{< / highlight >}}

- Update ~/.profile
{{< highlight bash >}}
code .bash_profile
{{< / highlight >}}

- Add gradle to the path
{{< highlight bash >}}
export GRADLE=/opt/gradle/gradle-5.2.1/bin
export PATH=$PATH:$GRADLE
{{< / highlight >}}

- Test *Note: Reboot may be required*
{{< highlight bash >}}
gradle
{{< / highlight >}}

> ## NVM (Nodejs and NPM)

[Guide](https://github.com/creationix/nvm#installation-and-update)

- Install
{{< highlight bash >}}
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
{{< / highlight >}}

- Verify install
{{< highlight bash >}}
command -v nvm
{{< / highlight >}}

- Install LTS
{{< highlight bash >}}
nvm install --lts
{{< / highlight >}}

- Verify Node and npm are installed
{{< highlight bash >}}
node -v
npm -v
{{< / highlight >}}

## Setup Git

Git should be installed by default

[Gitlab]()

Generate key
```sh
ssh-keygen -t ed25519 -C <email>
```

Copy public key to gitlab.com
```sh
code ~/.ssh/id_ed25519.pub
```

Create a development directory and clone a project
```sh
mkdir dev
cd dev
git clone git@github.com:DaveSvatora/documentation.git
```

## Runner
## Draw.io


# Make Windows 10 Install USB on Pop!_OS

[Guide](https://itsfoss.com/bootable-windows-usb-linux/)

## Download Windows 10 iso


## Install WoeUSB
```sh
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt update
sudo apt install woeusb
```

## Format USB

Right click usb, choose `Format...`

Choose NTFS

```sh
sudo woeusb --device ~/Downloads/Win10_1809Oct_English_x64.iso /dev/sdd --target-device NTFS
```

Select Downloaded ISO

## Hugo

Install snapd first

```
sudo apt install snapd
```

Install hugo as a snap

```
snap install hugo --channel=extended
```
