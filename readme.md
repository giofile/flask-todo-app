# Flask ToDo App Deployment Report

## Components of the Solution

### 1. **GitHub Actions**

GitHub Actions played a pivotal role in automating my deployment process. Custom workflows, triggered on main branch pushes, ensured seamless integration. These workflows managed dependency installation, Flask application testing, and secure deployments via SCP.

### 2. **Digital Ocean and SSH**

My application was deployed on Digital Ocean, where its competitive pricing provided excellent value. Through robust security measures, authenticated connections were established for a safe environment. SCP proved invaluable, facilitating encrypted file transfers between my local setup and the server.

### 3. **Nginx and Gunicorn**

Nginx, adeptly handled client requests. It seamlessly forwarded these requests to Gunicorn, my WSGI HTTP server, where my Flask application thrived. This powerful integration optimized request management and ensured efficient load balancing.

---

## Problems Encountered and Solutions

### 1. Ongoing Challenges

Despite the Flask app being accessible via the IP address, this persistent deployment error continues to challenge me. I've delved deep into the maze of logs, but the resolution remains elusive. It's been a rollercoaster of emotions — frustration, curiosity, and determination. This experience underscores the complexities of real-world applications, emphasizing the never-ending learning curve in the intricate world of server configurations and application deployments.

### 2. **SSH Connection Issues**

Encountered "Host key verification failed" error during SSH and SCP. Resolved by verifying the server's public key fingerprint, clearing known_hosts, and ensuring correct server IP.

### 3. **Gunicorn and Flask Integration**

Faced challenges in configuring Gunicorn to work with Flask. Reviewed Gunicorn documentation and Flask app structure to correctly specify the entry point and application instance.

### 4. **Nginx Configuration**

Struggled with Nginx configuration for Flask app routing. Found examples online and customized the Nginx configuration file to correctly proxy requests to the Gunicorn server.
