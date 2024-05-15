FROM ubuntu:latest

# Update package lists
RUN apt-get update

# Install unzip
RUN apt-get install -y unzip

# Install Java (OpenJDK)
RUN apt-get install -y openjdk-11-jdk

# Install wget
RUN apt-get install -y wget

# Install vim
RUN apt-get install -y vim

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set environment variables (optional)
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

RUN wget -O /opt/sonarqube-9.3.0.51899.zip https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip \
    && unzip /opt/sonarqube-9.3.0.51899.zip -d /opt \
    && rm /opt/sonarqube-9.3.0.51899.zip

RUN chown ubuntu:ubuntu /opt/sonarqube-9.3.0.51899 -R

RUN apt update

# Command to run when the container starts (optional)
CMD ["/bin/bash"]
