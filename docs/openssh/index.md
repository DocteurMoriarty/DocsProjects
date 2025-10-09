# OpenSSH

**OpenSSH (Open Secure Shell)** is a suite of open source tools for establishing secure network connections between machines, primarily via the **SSH (Secure Shell)** protocol. Originally developed by the OpenBSD team, OpenSSH is now widely used on Unix/Linux, macOS and Windows systems for remote administration and secure file transfer.

## Main objective
OpenSSH allows you to administer and communicate with remote systems in a **confidential**, **authenticated** and **fully encrypted** manner, replacing unsecured protocols such as **Telnet**, **rlogin**, or **FTP**.


## OpenSSH components


**`sshd`** SSH server service that accepts and manages incoming connections. \
**`ssh`** Client that enables a secure connection to be established to a remote host. \
**`scp (Secure copy)`** Secure file transfer. \
**`sftp`** Secure FTP protocol based on SSH. \
**`ssh-keygen`** Generating and managing SSH key pairs. \
**`ssh-agent`** et **`ssh-add`** Private key management in memory to avoid re-entering passwords. \
**`sshd_config`** / **`ssh_config`** Server and client configuration files.
