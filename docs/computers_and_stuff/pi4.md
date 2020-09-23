---
title: "Pi4"
date: 2019-09-15T21:49:56-05:00
draft: false
tags: ["pi","raspbian","linux"]
---

I got a `Raspberry Pi 4` recently to play around with on some home projects. I am going to try to see if its functional as a developer machine as well as run some dockerized apps on it. This post will document my experience and steps to get stuff up and running. Most of the documentation I do is essentially bread crumbs that I can later use to recreate something if I decide to blow it away and start over. 

## Choosing an OS

My first choice is to pick an OS. There aren't many available **yet** for PI4 so I'm starting with the officially supported [Raspbian Buster Lite](https://www.raspberrypi.org/downloads/raspbian/) distro. I'm also going to try to install the `Mate Desktop GUI` on top of Raspbian. [This guide](https://www.raspberrypi.org/forums/viewtopic.php?t=133691) talks about the steps you need to take to make it all work together.

### First Try

I got the PI4 connected, booted up, and all was going well...then I changed my password. Little did I know that changing the keyboard to US would end up bricking my OS. Because I used `special characters` in my password I got stuck on the terminal login with no way to get past it...time to reload the OS...fail #1

### Manjaro

I tried out manjaro and it was very nice on the PI. I was able to install some software, overclock the cpu and gpu, and try some stuff out. One quirk I found that led me to keep looking was the display resolution. For whatever reason it changed the monitor settings so that there was a border around the entire screen. I couldn't figure out how to get it to change back so I kept looking for other options.

### Ubuntu

Ultimately I'm going to try and set up a Ubuntu Server on the PI and use it to run some apps on my network, along with providing a local network share. Going to document the setup steps below.

#### Installation

Hop on over to Ubuntu's Site to download the latest ISO for [Raspberry PI4](https://ubuntu.com/download/raspberry-pi). Flash the microSD card using [Balena Etcher](https://www.balena.io/etcher/). Once finished pop it into the PI4 and run through the installation, change passwords, etc. Finally install open-ssh.

```
sudo apt install openssh-server
```

#### Wireless

First install wireless network-manager to use [nmcli](http://manpages.ubuntu.com/manpages/eoan/en/man1/nmcli.1.html)

```
sudo apt install network-manager
```

