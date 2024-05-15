FROM ubuntu:latest

# Update package lists
RUN apt-get update

# Install unzip
RUN apt-get install -y unzip

# Install Git
RUN apt-get install -y git

# Install Java (OpenJDK)
RUN apt-get install -y openjdk-8-jdk

# Install wget
RUN apt-get install -y wget

# Install vim
RUN apt-get install -y vim

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set environment variables (optional)
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

RUN wget -O /opt/gradle-6.8.3-bin.zip https://distfiles.macports.org/gradle/gradle-6.8.3-bin.zip

RUN unzip /opt/gradle-6.8.3-bin.zip -d /opt

RUN rm /opt/gradle-6.8.3-bin.zip

ENV export PATH=$PATH:/opt/gradle-6.8.3/bin

RUN mkdir workspace

RUN git clone https://github.com/Shikhar82/springboot-tomcat-gradle-war.git ./workspace/springboot-tomcat-gradle-war

# Command to run when the container starts (optional)
CMD ["/bin/bash"]
