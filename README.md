<h1 align=center>
  <strong> Inception </strong>
</h1>

## 💡 About the project

> Since the project is a system administration-related one, I'll document pretty much everything you need to know about the project from start to finish in this readme file, hope you find this useful 😇

> And of course, I might and will be mistaken for something, so please if there's a mistake or a misunderstanding, let me know by doing a pull request or just by a direct message! **THANK YOU SO MUCH** ☺️

## ✏︎  The topics we will discuss in this README are:

  [∙ What is Docker?](#what-is-docker)

  [∙ What is a Docker Image?](#what-is-a-docker-image)

  [∙ What is a Dockerfile?](#what-is-a-dockerfile)

  [∙ What is a Docker Compose?](#what-is-a-docker-compose)

  [∙ What is a Container?](#what-is-a-container)
  
  [∙ What is The Difference Between Container and VM?](#what-is-the-difference-between-container-and-vm)
  
  [∙ What is PID 1?](#what-is-pid-1)
  
  [∙ Is the Daemon Process PID 1? And How Does They Differ From Each Other?](#is-the-daemon-process-pid-1-and-how-does-they-differ-from-each-other)
  
  [∙ What is WP-CLI?](#what-is-wp-cli)
  
  [∙ Why Do You Need to Work With WP-CLI?](#why-do-you-need-to-work-with-wp-cli)
  
  [∙ What is Redis Cache? And Why Do You Need it in WordPress?](#what-is-redis-cache-and-why-do-you-need-it-in-wordpress)
  
  [∙ What is FTP? And How Does it Work?](#what-is-ftp-and-how-does-it-work)
  
  [∙ How to Configure FTP? And How to Test If it's Working?](#how-to-configure-ftp-and-how-to-test-if-its-working)

## What is Docker?

  Docker is a tool designed to allow you to build, deploy and run applications in an isolated and consistent manner across different machines and operating systems. This process is done using <strong>CONTAINERS</strong>. which are lightweight virtualized environments that package all the dependencies and code an application needs to run into a single text file, which can run the same way on any machine.
  
  While Docker is primarily used to package and run applications in containers, it is not limited to that use case. Docker can also be used to create and run other types of containers, such as ones for testing, development, or experimentation.

## What is a Docker Image?

  Docker Image is a lightweight executable package that includes everything the application needs to run, including the code, runtime environment, system tools, libraries, and dependencies.
  
  Although it cannot guarantee error-free performance, as the behavior of an application ultimately depends on many factors beyond the image itself, using Docker can reduce the likelihood of unexpected errors.
  
  Docker Image is built from a <strong>DOCKERFILE</strong>, which is a simple text file that contains a set of instructions for building the image, with each instruction creating a new layer in the image.

## What is a Dockerfile?

  Dockerfile is that <ins><i><strong>SIMPLE TEXT FILE</strong></i></ins> that I mentioned earlier, which contains a set of instructions for building a Docker Image. It specifies the base image to use and then includes a series of commands that automate the process for configuring and building the image, such as installing packages, copying files, and setting environment variables. Each command in the Dockerfile creates a new layer in the image.
  
  Here's an example of a Dockerfile to make things a little bit clear:

```bash
# This Specifies the base images for the container (in this case, it's the 3.14 version of Alpine)
FROM alpine:3.14

# This Run commands in the container shell, and installs the specified packages
# (it will install nginx & openssl, and will create the directory "/run/nginx" as well)
RUN apk update && \
    apk add nginx openssl && \
    mkdir -p /run/nginx

# This Copies the contents of "./conf/nginx.conf" on the host machine to the "/etc/nginx/http.d/"
# directory inside the container
COPY ./conf/nginx.conf /etc/nginx/http.d/default.conf

# This Specifies the command that will run when the container get started
CMD ["nginx", "-g", "daemon off;"]

```

## What is a Docker Compose?

  Docker Compose is a powerful tool that simplifies the deployment and management of multi-container Docker applications. It provides several benefits, including simplifying the process of defining related services, volumes for data persistence, and networks for connecting containers. With Docker Compose, you can easily configure each service's settings, including the image to use, the ports to expose, and the environment variables to set...

  Overall, Docker Compose streamlines the development process, making it easier for you to build and deliver your applications with greater efficiency and ease.
  
  A Docker Compose has <strong>3 important parts</strong>, which are:
  
  * <strong>Services:</strong> A service is a unit of work in Docker Compose, it has a name, and it defines a container images, a set of environment variables, and a set of ports that are exposed to the host machine. When you run `docker-compose up`, Docker will create a new container for each service in your Compose file.

  * <strong>Networks:</strong> A network is a way for containers to communicate with each other. When you create a network in your Compose file, Docker will create a new network that all the other containers in your Compose file will be connected to. This allows containers to communicate with each other without even knowing the IP of each other, just by the name.

  * <strong>Volumes:</strong> A volume is a way to store data that is shared between containers. When you create a volume in your Compose file, Docker will create a new volume (a folder in another way) that all the containers have access to. This allows you to share data between the containers without having to copy-paste each and every time you want that data.

  Here's an example of a Docker Compose to make things a little bit clear:
   
```bash
version: '3'

# All the services that you will work with should be declared under the SERVICES section!
services:

  # Name of the first service (for example: nginx)
  nginx:
  
    # The hostname of the service (will be the same as the service name!)
    hostname: nginx
    
    # Where the service exist (path) so you can build it
    build:
      context: ./requirements/nginx
      dockerfile: Dockerfile
      
    # Restart to always keep the service restarting in case of any unexpected errors causing it to go down
    restart: always
    
    # This line explains itself!!!
    depends_on:
      - wordpress
      
    # The ports that will be exposed and you will work with
    ports:
      - 443:443
      
    # The volumes that you will be mounted when the container gets built
    volumes:
      - wordpress:/var/www/html
      
    # The networks that the container will connect and communicate with the other containers
    networks:
      - web
```
   

## What is a Container?

  A Container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another.

## What is The Difference Between Container and VM?

  Containers and Virtual machines have similar resource isolation and allocation benefits but function differently because containers virtualize the operating system instead of the hardware. Containers are more portable and efficient.
  
  * <ins><strong>Containers</strong></ins> are an abstraction at the app layer that packages code and dependencies together. Multiple containers can run on the same machine and share the OS kernel with other containers, each running as isolated processes in user space. Containers take up less space than VMs (talks about tens of MBs in size), can handle more applications, and require fewer VMs and Operating Systems.

  <p align="center" width="100%">
    <img width="598" src="https://user-images.githubusercontent.com/63506492/233226746-6594ac04-341d-474e-b918-3df1d95c7b95.png">
  </p>
  
  * <ins><strong>Virtual Machines (VMs)</strong></ins> are an abstraction of physical hardware turning one server into many servers. The hypervisor allows multiple VMs to run on a single machine. Each machine includes a full copy of an operating system, the application, necessary binaries, and libraries. VMs take more space compared to containers (talking about tens of GBs in size), and they can be slow to boot.
  
  <p align="center" width="100%">
    <img width="539" src="https://user-images.githubusercontent.com/63506492/233227532-82371157-98c5-469e-82b4-c7606ee17831.png">
  </p>
  
## What is PID 1?

  In a Docker container, the PID 1 process is a special process that plays an important role in the container's lifecycle. This process is the identifier of the init process, which is the first process that is started when the system boots up, and it is responsible for starting and stoping all of the other processes on the system. And in Docker as well, the init process is responsible for starting and stoping the application that is running in the container.
      
   > PID 1 in a Docker container behaves differently from the init process in a normal Unix-based system. (they are NOT the same!)

## Is the Daemon Process PID 1? And How Does They Differ From Each Other?

  `The daemon process is NOT the PID 1`, the daemon process is a background process that runs continuosuly on a system and performs a specific task. In contrast, PID 1 is the first process that the kernel starts in a Unix-based system and plays a special role in the system.

## What is WP-CLI?

  WP-CLI is the command line interface for WordPress. It is a tool that allows you to interact with your WordPress site from the command line, it is used for a lot of purposes, such as automating tasks, debugging problems, installing/removing plugins along side with themes, managing users and roles, exporting/importing data, run databses queries, and so much more...

## Why Do You Need to Work With WP-CLI?

  Since its a tool that allows you to interact directly with your WordPress site from the terminal, it can save you a lot of time that will take you to (for example) installing a pluging/theme manually, moderate users and their roles, deploy a new WordPress website to a production server, etc...
  
  WP-CLI will help you do all that in less time and automated as well, so It's a really a great tool that will help you react with your WordPress website.
  
  Here's an example demonstrating how to run WP-CLI in a bash script to configure WordPress environment:

```bash
#!/bin/sh

# We will first check if the "/var/www/html" folder exist or not, if not we create it
if [ ! -d "/var/www/html" ]; then
  mkdir -p /var/www/html
fi

# We will cd into the folder
cd /var/www/html

# This downloads the WordPress core files, the option ( --allow-root ) will run the command as root
# and ( --version:5.8.1 ) specifies the version of WordPress that will get downloaded
# and ( --local=en_US ) sets the language of the installation to US English
wp core download --allow-root --version=5.8.1 --locale=en_US

# This will generate the WordPress configuration file, and the options ( --dbname, --dbuser, --dbpass, --dbhost )
# are just placeholders that will get replaced once the script runs
wp config create --allow-root --dbname=${WP_NAME} --dbuser=${WP_ADMIN_USER} --dbpass=${WP_PASSWORD} --dbhost=${WP_HOST}

# This will then install WordPress, and again, all the options are just placeholders that will get replaced
wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}

# This create a new WordPress user, and sets its role to author ( --role=author )
wp user create "${WP_USER}" "${WP_EMAIL}" --user_pass="${WP_PASSWORD}" --role=author

# This is the command that will keep WordPress up and running
exec php-fpm7 -F -R 
```
  
## What is Redis Cache? And Why Do You Need it in WordPress?

  Redis Cache, or Redis Object Cache, is an open-source, in-memory data structure store that can be used as database, cache, or message brocker. It's a plugin for WordPress that improves the performance of your website by storing accessed data in memory, rather than querying the database each and every time that data is needed.
  
  You need Redis Cache plugin in your WordPress website because it can improve the performance of the website and reduce the time that it takes to load all the data from your databases, which will cause in a better user experience, plus it will help your website rank higher in search engines, etc...
  
  In this project of Inception, in order to Redis Cache to work perfectly, you need to add this line in your WordPress script:

  * If you're using Alpine: ` chown -R nobody:nobody * `
  * If you're using Debian: ` chown -R www-data:www-data * `

What does this basically do is that it changes the ownership of all files and directories recursively `(-R)` to the user and group `nobody:nobody` or `www-data:www-data`

Plus, you also will need to add the `REDIS_HOST` as long as the `REDIS_PORT` to your WordPress `wp-config.php`

Here's and example:
```bash
sed -i "41 i define( 'WP_REDIS_HOST', 'redis' );\ndefine( 'WP_REDIS_PORT', '6379' );\n" wp-config.php
```
This will add 2 lines to the `wp-config.php` in the 41st line of the file, the first is `define( 'WP_REDIS_HOST', 'redis' );` and the second is `define( 'WP_REDIS_PORT', '6379' );`. Those 2 lines will specify the host and port that Redis Cache will use to establish the connection.

  > Adding them using `echo` seems to cause some problems, and Redis Cache does not want to establish the connection!


## What is FTP? And How Does it Work?

  FTP or File Transfer Protocol is a protocol that's used for transferring files between a client and a server over TCP/IP network, such as the internet. It provides a robust mechanism for users to upload, download, and manage files on remote servers.
  
  FTP works by opening two connections that link the 2 hosts (client and server) trying to communicate between each other, one connection is designed for the commands and replies that gets sent between the two clients, and the other connection is handles the transfer of the data.

## How to Configure FTP? And How to Test If it's Working?
  
  
  
  
  
  
  
  
  
  
  
