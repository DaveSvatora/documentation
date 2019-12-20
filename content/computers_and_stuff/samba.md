---
title: "Samba"
date: 2019-12-15T08:42:06-06:00
draft: false
tags: ["samba","network","file share"]
---

I want to create shared folder that I can access from any device on my local network so I decided to try out [Samba]() to get some experience. I'm mainly using this [guide](https://www.fosslinux.com/8703/how-to-setup-samba-file-sharing-server-on-ubuntu.htm), but my notes will be a scaled down version. Ubuntu also has a great tutorial [here](https://tutorials.ubuntu.com/tutorial/install-and-configure-samba#0)

### Installation

```
sudo apt install samba
```

Verify Installation with: ```whereis samba```

---

### Users and Groups

We want to create a samba user and group and add our user to the group.

{{% notice note %}}
You can use the existing Ubuntu user as well. If you do not want to add a new user skip to the **Create Group** step. More information about users and groups can be found [here](https://vitux.com/add-and-manage-user-accounts-in-ubuntu-18-04-lts/)
{{% /notice %}}

#### Create User

adduser will create the new user and prompt for a password

```
sudo adduser smbuser
```

#### Create Group

```
sudo addgroup smbgroup
```

Add our user to the group

```
sudo usermod -aG smbgroup smbuser
```

Set the samba password. *Note this will be the password used when connecting from a remote device*

```
sudo smbpasswd -a smbuser
```

---

### Set up and configure Samba

Next we will create the directory we want to share on our network and configure Samba to serve it.

#### Directory

```
sudo mkdir -p /home/smbuser/samba/share/
```

Set up the permissions

```
sudo chown -R root:smbgroup /home/smbuser/samba/share
sudo chmod -R 0770 /home/smbuser/samba/share
```

#### Configure Samba

Last but not least we need to configure Samba to share our directory we just created. There are lots of configurations available, but in this case we are just going to simplify the file.

```
sudo nano /etc/samba/samba.conf
```

Replace the contents with this

```
[global]
workgroup = WORKGROUP
server string = Samba Server %v
netbios name = <name of your machine>
security = user

[share]
path = /home/smbuser/samba/share
valid users = @smbgroup
guest ok = no
writable = yes
browsable = yes
```

Restart Samba

```
sudo service smbd restart
```

Check the config

```
testparm
```

---

### Connect from another device

At this point you should now be sharing a folder on your LAN. There are lots of ways to connect, the easiest is to use network discovery on the OS you are running. Another option is to manually type in the IP address. When prompted you will need to enter your user and password we created earlier.

---

### External Drive

I had some issues getting the permissions set up right for an external hard drive. I fought with it over and over trying to get the permissions ot work right with `chown` and `nautilus`, but nothing would take. I ended up finding one answer on [superuser](https://superuser.com/a/57096) that fixed the mount.

#### Step 1

Open `Disks` and take note of the mount point for me it was `/dev/sda1` mounted to `/media/<user>/<ExternalDrive>`

#### Step 2

Unmount the drive in `Disks` selecting the external drive and pressing the stop button

#### Step 3

Remount the drive using the appropriate permissions

```
sudo mount -o uid=root,gid=smbgroup /dev/sda1 /media/<user>/<ExternalDrive>
```

{{% notice note %}}
Replace `<user>` with your ubuntu user and `<ExternalDrive>` with the name of your external drive.
{{% /notice %}}

{{% notice info %}}
External hard drives can only be accessed by users with root access or mounted to the users directory. Ex: user1 cannot access an external samba share mounted to `/media/user2/drive`
{{% /notice %}}

### Editing fstab

{{% notice warning %}}
Danger, please know what your doing before proceeding...see this [guide](https://help.ubuntu.com/community/Fstab#Editing_fstab)
{{% /notice %}}

For me setting the permissions and ntfs-3g options auto mounted my external hard drive how I wanted.

```
UUID=FAEA8385EA833D3F   /media/<user>/Seagate\040Expansion\040Drive     ntfs-3g auto,users,uid=root,gid=smbgroup,locale=en_US.UTF-8     0       0
```