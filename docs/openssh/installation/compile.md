## 1. Installation on Linux

### Debian / Ubuntu

Note: the current version of OpenSSH is 10.1, but feel free to download the latest version available on the official website: https://www.openssh.com/releasenotes.html


#### Initialising variables 
> [!NOTE]
> Go to the repository and download the latest version: https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/

**VERSION** : specifies the version of OpenSSH you wish to install.

**URL** : direct link to the OpenSSH tar.gz archive for this version.

**SIG_URL** : link to the corresponding PGP signature file, to verify the integrity and authenticity of the archive.

```bash
VERSION=10.1
URL="https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/openssh-$VERSION.tar.gz"
SIG_URL="https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/openssh-$VERSION.tar.gz.asc"
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
####
gpg --show-keys --with-fingerprint openssh-keys.asc


####
gpg --import openssh-keys.asc


# Vérification de la signature
gpg --verify "openssh-$VERSION.tar.gz.asc" "openssh-$VERSION.tar.gz"

# Extraction si la vérification est OK
tar -xzf "openssh-$VERSION.tar.gz"
cd "openssh-$VERSION"

# Compilation classique
./configure
make
sudo make install
