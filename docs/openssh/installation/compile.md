## Installation

### Debian / Ubuntu

Note: the current version of OpenSSH is 10.1, but feel free to download the latest version available on the official website: https://www.openssh.com/releasenotes.html


#### Initialising variables 
> [!NOTE]
> Go to the repository and download the latest version: https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/ \
> **Install the necessary tools** 
>```bash
>apt update
>apt install build-essential zlib1g-dev libssl-dev libpam0g-dev libselinux1-dev libedit-dev
>```

**VERSION** : specifies the version of OpenSSH you wish to install.

**URL** : direct link to the OpenSSH tar.gz archive for this version.

**SIG_URL** : link to the corresponding PGP signature file, to verify the integrity and authenticity of the archive.

```bash
VERSION=10.1p1
URL="https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-$VERSION.tar.gz"
SIG_URL="https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-$VERSION.tar.gz.asc"
```
#### Secure download with TLS encryption and SSL verification
```bash
wget --https-only --secure-protocol=TLSv1_3 --ca-directory=/etc/ssl/certs "$URL" -O "openssh-$VERSION.tar.gz"
```
#### Download the associated signature
```bash
wget --https-only --secure-protocol=TLSv1_3 --ca-directory=/etc/ssl/certs "$SIG_URL" -O "openssh-$VERSION.tar.gz.asc"
```

#### Secure download of the official OpenSSH PGP key via TLS
```bash 
wget --https-only --secure-protocol=TLSv1_3 --ca-directory=/etc/ssl/certs https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/RELEASE_KEY.asc -O openssh-keys.asc
```
#### Verifying OpenSSH public keys
Before verifying the OpenSSH file signature, it is recommended to **verify the fingerprint of the keys contained** in `openssh-keys.asc`.  
The command below displays all public keys and their fingerprints to ensure that they match the official keys published by OpenSSH
```bash
gpg --show-keys --with-fingerprint openssh-keys.asc
```
![Logo OpenSSH](/openssh/keyopensshverify.png)


This command imports the public key downloaded from the official OpenSSH website into your GPG keyring, which then allows you to verify the signatures of downloaded files.

```bash
gpg --import openssh-keys.asc
```

#### Signature verification
```bash
gpg --verify "openssh-$VERSION.tar.gz.asc" "openssh-$VERSION.tar.gz"
```
![Logo OpenSSH](/openssh/same-signatures.png)


#### Extract if verification is OK
```bash
tar -xzf "openssh-$VERSION.tar.gz"
cd openssh-$VERSION # folder name; the latter can be ssh
```
#### Add the sshd user

```bash
/sbin/useradd -r -M -U -s /usr/sbin/nologin -d /var/run/sshd sshd
```

#### Compilation
```bash
./configure
make
sudo make install
```