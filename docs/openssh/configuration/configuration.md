## Configuration

### Debian / Ubuntu


### Installation of ssh-audit 
> [!NOTE]
> **Install the necessary tools**
>```bash
>python3 -m venv venv
>source venv/bin/activate
>pip install ssh-audit
>```

#### Command to obtain the information necessary for the security of the SSH configuration
```bash
ssh-audit localhost -p 2222
```

#### Command to obtain maximum information

```bash
ssh-audit --batch --verbose --debug --level=info --timeout=10 localhost -p 2222 > ssh-audit-full.txt
```
### Correction of sensitive configurations

#### Creation of the custom configuration file
> [!NOTE]
> It is important not to save these changes directly in the main configuration file (/etc/ssh/ssh_config or /etc/ssh/sshd_config). This is because any update to
> the OpenSSH package will overwrite the main file and delete your custom configurations.
```bash
sudo nano /etc/ssh/ssh_config.d/hardening.conf
```