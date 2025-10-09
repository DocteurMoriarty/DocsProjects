## What is MariaDB?

MariaDB is an open-source relational database management system (RDBMS) that serves as a drop-in replacement for MySQL.
It is known for its high performance, stability, and advanced security features.

---

## How to install MariaDB?

You can install MariaDB using your system’s package manager.
Below are the steps for the most common Linux distributions.

---

### Debian

1. **Update the package list**

   ```bash
   sudo apt update
   ```

2. **Install software-properties-common**

   ```bash
   sudo apt install software-properties-common -y
   ```

3. **Add the official MariaDB repository**

   ```bash
   sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
   sudo add-apt-repository 'deb [arch=amd64] http://mariadb.mirror.server/location mariadb-11.4 main'
   ```

4. **Install MariaDB**

   ```bash
   sudo apt update
   sudo apt install mariadb-server -y
   ```

5. **Secure the installation**

   ```bash
   sudo mysql_secure_installation
   ```

   Follow the prompts to:

   * Set a strong root password
   * Remove anonymous users
   * Disallow remote root login
   * Remove the test database

---

### Ubuntu

1. **Update packages**

   ```bash
   sudo apt update
   ```

2. **Install MariaDB**

   ```bash
   sudo apt install mariadb-server mariadb-client -y
   ```

3. **Start and enable MariaDB**

   ```bash
   sudo systemctl start mariadb
   sudo systemctl enable mariadb
   ```

4. **Run security configuration**

   ```bash
   sudo mysql_secure_installation
   ```

---

### Fedora

1. **Install MariaDB**

   ```bash
   sudo dnf install mariadb-server -y
   ```

2. **Start and enable the service**

   ```bash
   sudo systemctl enable mariadb
   sudo systemctl start mariadb
   ```

3. **Run security script**

   ```bash
   sudo mysql_secure_installation
   ```

---

## Verify the Installation

Check that MariaDB is running:

```bash
sudo systemctl status mariadb
```

Login to the MariaDB shell:

```bash
sudo mysql -u root -p
```

If you can log in and run:

```sql
SHOW DATABASES;
```

then MariaDB is installed successfully.

---

## Enable Remote Access (Optional)

1. Edit the MariaDB configuration file:

   ```bash
   sudo nano /etc/mysql/mariadb.conf.d/50-server.cnf
   ```
2. Find the line:

   ```
   bind-address = 127.0.0.1
   ```

   and change it to:

   ```
   bind-address = 0.0.0.0
   ```
3. Restart the service:

   ```bash
   sudo systemctl restart mariadb
   ```

---

## Security Best Practices

* Always use **strong passwords** for all accounts.
* Disable **remote root login**.
* Use **SSL/TLS** for encrypted connections.
* Regularly **update** MariaDB to the latest stable release.
* Apply **CNIL and GDPR** recommendations if handling personal data.

---

## Next Steps

* Learn how to **create databases and users**
* Configure **user privileges**
* Enable **data encryption** at rest and in transit
* Integrate MariaDB with your **web applications** (Symfony, Laravel, etc.)

---

✅ **MariaDB is now ready to use on your system!**
