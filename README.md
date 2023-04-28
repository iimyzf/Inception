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
  
  [∙ What is the difference between Container and VM?](#what-is-the-difference-between-container-and-vm)

## What is Docker?

  Docker is a tool designed to allow developers to build, deploy and run applications in an isolated and consistent manner across different machines and operating systems. This process is done using <strong>CONTAINERS</strong>. which are lightweight virtualized environments that package all the dependencies and code an application needs to run into a single text file, which can run the same way on any machine.
  
  While Docker is primarily used to package and run applications in containers, it is not limited to that use case. Docker can also be used to create and run other types of containers, such as ones for testing, development, or experimentation.

## What is a Docker Image?

  Docker Image is a lightweight executable package that includes everything the application needs to run, including the code, runtime environment, system tools, libraries, and dependencies. Although it cannot guarantee error-free performance, as the behavior of an application ultimately depends on many factors beyond the image itself, using Docker can reduce the likelihood of unexpected errors.
  
  Docker Image is built from a <strong>DOCKERFILE</strong>, which is a simple text file that contains a set of instructions for building the image, with each instruction creating a new layer in the image.

## What is a Dockerfile?

  Dockerfile is that <ins><i><strong>SIMPLE TEXT FILE</strong></i></ins> that I mentioned earlier, which contains a set of instructions for building a Docker Image. It specifies the base image to use and then includes a series of commands that automate the process for configuring and building the image, such as installing packages, copying files, and setting environment variables. Each command in the Dockerfile creates a new layer in the image.

## What is a Docker Compose?

  Docker Compose is a powerful tool that simplifies the deployment and management of multi-container Docker applications. It provides several benefits, including simplifying the process of defining related services, volumes for data persistence, and networks for connecting containers. With Docker Compose, developers can easily configure each service's settings, including the image to use, the ports to expose, and the environment variables to set...

  Overall, Docker Compose streamlines the development process, making it easier for developers to build and deliver their applications with greater efficiency and ease.
  
  A Docker Compose has 4 important parts, which are:
  
  * Services: A service is an abstract concept implemented on platforms by running the same container image one or many times. In other words, a service is a way to define and manage a group of containers that provide a specific function, and it simplifies the deployment and management of your applications and allows you to scale up or down as needed.
  * Networks: A network is an abstraction layer that simplifies the process of setting up networking between containers within a service. It is a way of connecting multiple containers together so that they can communicate with each other, when creating a network, Docker sets up an IP address range and a DNS server for the network. Each container gets its unique IP address within that range, which allows them to communicate with each other over the network.
  * Volumes: gfgdfdf

## What is a Container?

  A Container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another.

## What is the difference between Container and VM?

  Containers and Virtual machines have similar resource isolation and allocation benefits but function differently because containers virtualize the operating system instead of the hardware. Containers are more portable and efficient.
  
  * <ins><strong>Containers</strong></ins> are an abstraction at the app layer that packages code and dependencies together. Multiple containers can run on the same machine and share the OS kernel with other containers, each running as isolated processes in user space. Containers take up less space than VMs (talks about tens of MBs in size), can handle more applications, and require fewer VMs and Operating Systems.

  <p align="center" width="100%">
    <img width="598" src="https://user-images.githubusercontent.com/63506492/233226746-6594ac04-341d-474e-b918-3df1d95c7b95.png">
  </p>
  
  * <ins><strong>Virtual Machines (VMs)</strong></ins> are an abstraction of physical hardware turning one server into many servers. The hypervisor allows multiple VMs to run on a single machine. Each machine includes a full copy of an operating system, the application, necessary binaries, and libraries. VMs take more space compared to containers (talking about tens of GBs in size), and they can be slow to boot.
  
  <p align="center" width="100%">
    <img width="539" src="https://user-images.githubusercontent.com/63506492/233227532-82371157-98c5-469e-82b4-c7606ee17831.png">
  </p>
