FROM ubuntu:latest

# Update package lists
RUN apt-get update

# Install unzip
RUN apt-get install -y unzip

# Install Java (OpenJDK)
RUN apt-get install -y openjdk-11-jdk

# Install wget
RUN apt-get install -y wget

# Install curl
RUN apt-get install -y curl

# Install vim
RUN apt-get install -y vim

# Install git
RUN apt-get install -y git

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set environment variables (optional)
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

RUN wget -O /opt/apache-maven-3.8.5-bin.tar.gz https://archive.apache.org/dist/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.tar.gz \
    && tar -xzf /opt/apache-maven-3.8.5-bin.tar.gz -C /opt \
    && rm /opt/apache-maven-3.8.5-bin.tar.gz

# Install Jenkins
RUN curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

RUN echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]  https://pkg.jenkins.io/debian-stable binary/ | tee /etc/apt/sources.list.d/jenkins.list > /dev/null

RUN apt update

RUN apt install -y jenkins

# Command to run when the container starts (optional)
CMD ["/bin/bash"]

