FROM ubuntu:latest

# Update package lists
RUN apt-get update

# Install Java (OpenJDK)
RUN apt-get install -y openjdk-11-jdk

# Install Git
RUN apt-get install -y git

# Install wget
RUN apt-get install -y wget

# Install vim
RUN apt-get install -y vim

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set environment variables (optional)
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

RUN wget -O /opt/apache-maven-3.8.5-bin.tar.gz https://archive.apache.org/dist/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.tar.gz \
    && tar -xzf /opt/apache-maven-3.8.5-bin.tar.gz -C /opt \
    && rm /opt/apache-maven-3.8.5-bin.tar.gz

# Set environment variables for Maven
ENV PATH=$PATH:/opt/apache-maven-3.8.5/bin

RUN mkdir workspace

RUN git clone https://github.com/Shikhar82/springboot-maven-micro.git ./workspace/springboot-maven-micro

# Command to run when the container starts (optional)
CMD ["/bin/bash"]
