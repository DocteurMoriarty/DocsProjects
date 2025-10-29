# SSH Hardening and Algorithm Management Guide

### Debian / Ubuntu  
###### https://www.man7.org/linux/man-pages/man5/sshd_config.5.html

While the official man page offers a comprehensive reference, this guide adds precision and actionable context to key parameters, including port settings, authentication controls, and cryptographic algorithm management.

---
### Core Configuration Parameters
> [!NOTE]
> **Parameters to know for proper configuration**
>```bash
>    Port 2222  
>    ```
>    Sets the listening port for the SSH service. Changing the default port (22)  
>    can reduce automated attacks.
>
>```bash
>    PermitRootLogin no  
>   ```
>    Prohibits direct connection as root. Recommended to prevent  
>    compromises.
>```bash
>    PasswordAuthentication no
>   ```
>    Disables password authentication. Requires the use of  
>    SSH keys for greater security.
>```bash
>   PubkeyAuthentication yes
>   ```
>   Enables public key authentication. Required if  
>   PasswordAuthentication is disabled.
>```bash
>    AllowUsers username
>    ```
>   Restricts SSH access to specified users. Can be replaced  
>   or supplemented by AllowGroups.
>```bash
>    MaxAuthTries 3
>   ```  
>    Limite le nombre de tentatives d’authentification avant déconnexion.
>```bash
>    LogLevel VERBOSE
>   ```  
>   Defines the logging level. VERBOSE allows you to track  
>   connection attempts.
>```bash
>    AuthenticationMethods publickey,password
>   ```  
>   Requires multiple authentication methods combined (e.g., key + password).  
>   Useful for enhancing security.
>```bash
>    PermitEmptyPasswords no  
>   ```
>   Refuse connections with empty passwords, even if allowed by the system.
>```bash
>    UseDNS no
>   ```  
>   Disables reverse DNS resolution for clients. Speeds up connections  
>   and prevents certain blockages.
>```bash
>    ClientAliveInterval 300
>   ```  
>   Send a signal every 300 seconds to verify that the client is still active.
>```bash
>    ClientAliveCountMax 2
>   ```  
>   If no signal is received after 2 intervals, the session is closed.
>```bash
>    RevokedKeys /etc/ssh/revoked_keys
>   ```  
>   File containing explicitly revoked public keys. Prevents their use  
>   even if they are valid.
>```bash
>    VersionAddendum none
>   ```  
>   Removes the display of the OpenSSH version in the login banner.  
>   Reduces the amount of information exposed.
>```bash
>    ChannelTimeout 10m
>   ```  
>   (OpenSSH 9.6+) Automatically closes inactive channels after 10 minutes.
>```bash
>    SecurityKeyProvider /usr/lib/libsk-libfido2.so
>   ```  
>   Enables support for hardware security keys (e.g., Yubikey via FIDO2).
>




### Cryptographic Algorithm Management

> [!NOTE]
> **Key Exchange Algorithms (Kex)**
>```bash
>ssh -Q kex
>```
>Lists supported key exchange algorithms. Use this to audit or restrict insecure options  
>like `diffie-hellman-group1-sha1`.
> **Encryption Algorithms (Ciphers)**
>```bash
>ssh -Q cipher
>```
>Displays available encryption algorithms. Prefer modern ciphers like `aes256-ctr` and  
>disable legacy ones like `arcfour`.
> **Message Authentication Code Algorithms (MACs)**
>```bash
>ssh -Q mac
>```
>Shows supported MAC algorithms used for integrity checking. Recommended:  
>`hmac-sha2-512`, `hmac-sha2-256`.
> **Host Key Algorithms**
>```bash
>ssh -Q key
>```
>Lists host key signature algorithms. Use strong options like `ecdsa-sha2-nistp256`  
>or `ssh-ed25519`. Avoid deprecated ones like `ssh-rsa`.


### SSH Algorithm Management Parameters

> [!NOTE]
>```bash
> Ciphers aes256-ctr,aes192-ctr,aes128-ctr
>```
>Defines which encryption algorithms are allowed.
>
>```bash
> MACs hmac-sha2-512,hmac-sha2-256
>```
>Specifies integrity-check algorithms.
>
>```bash
> KexAlgorithms curve25519-sha256,ecdh-sha2-nistp521
>```
>Controls how keys are securely exchanged.
>
>```bash
> HostKeyAlgorithms ssh-ed25519,ecdsa-sha2-nistp256
>```
>Defines which algorithms are used to verify the server's identity.
>
>```bash
> CASignatureAlgorithms rsa-sha2-512,rsa-sha2-256
>```
>Used when verifying certificates signed by a Certificate Authority.
>
>```bash
> RekeyLimit 1G 1h
>```
>Forces rekeying after 1 GB of data or 1 hour of session time.
