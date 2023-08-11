## Serving Static Content
## Basic Authentication

**nginx.conf:**
This Nginx configuration is set up to serve a website with different content for various URL paths and enforce Basic Authentication for a specific path:

- `http`: This block contains the server-wide settings for the HTTP protocol.

- `server`: Within the `http` block, this section defines the configuration for a single virtual server.

  - `listen 80;`: Specifies that the server should listen on port 80 for incoming HTTP requests.
  - `root /data;`: Sets the root directory for serving web content to the `/data` directory.
  - `index index.html;`: Specifies that if a directory is accessed without specifying a filename, the server should look for an `index.html` file.
  - `proxy_set_header Host $host:$server_port;`: Sets the `Host` header to the value of the requested host and server port, which can be used for proxying requests.

- `location /`: Defines behavior for requests to the root URL path (`/`).

  - `root /data;`: Sets the root directory for serving content to the `/data` directory.
  - `index index.html;`: Specifies that `index.html` should be the default index file to serve.

- `location /about`: Defines behavior for requests to the `/about` URL path.

  - `root /data;`: Sets the root directory for serving content to the `/data` directory.
  - `index about.html;`: Specifies that `about.html` should be the index file for this path.

- `location /profile`: Defines behavior for requests to the `/profile` URL path.

  - `auth_basic "Restricted Content";`: Enforces Basic Authentication with the realm "Restricted Content."
  - `auth_basic_user_file /etc/nginx/.htpasswd;`: Specifies the file containing user credentials for authentication.
  - `root /data;`: Sets the root directory for serving content to the `/data` directory.
  - `index profile.html;`: Specifies that `profile.html` should be the index file for this path.



2. **Dockerfile:**

   A Dockerfile is a script that tells Docker how to build a Docker image. This image can then be used to create and run containers. Let's break down what's happening here:
   
   - `FROM nginx:1.24.0-alpine`: This line specifies that the image we're building will be based on the official Nginx image tagged as version 1.24.0-alpine. The "alpine" part means it's a lightweight version based on the Alpine Linux distribution.
   - `RUN rm /etc/nginx/nginx.conf`: This line removes the default Nginx configuration file from the image. We'll be using our own custom configuration file.
   - `COPY nginx.conf /etc/nginx/nginx.conf`: This line copies our custom `nginx.conf` file (the one you explained earlier) into the image at the location `/etc/nginx/nginx.conf`.

3. **docker-compose.yml:**

   Docker Compose is a tool for defining and running multi-container Docker applications. This YAML file outlines how to set up and configure the containers for your application:
   
   - `version: "3.8"`: This specifies the version of the Compose file syntax being used.
   - `services:`: This section defines the services (containers) that make up your application.
   - `nginx:`: The name of the service.
     - `image: nginx:1.24.0-alpine`: The image to be used for this service.
     - `container_name: nginx-container`: The name of the container that will be created.
     - `ports:`: This maps the host's port 8080 to the container's port 80, so you can access the server at `http://localhost:8080`.
     - `volumes:`: This maps local directories (`nginx-html` and `config`) to directories in the container (`/usr/share/nginx/html` and `/etc/nginx`). It's a way to share files between the host and the container.

Overall, these files work together to create a Dockerized Nginx web server, with a custom configuration and the ability to easily manage it using Docker Compose.