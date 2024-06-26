FROM ubuntu:latest

# Update package lists
RUN apt-get update

# Install unzip
RUN apt-get install -y unzip

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

RUN wget -O /opt/nexus-3.38.0-01-unix.tar.gz https://download.sonatype.com/nexus/3/nexus-3.38.0-01-unix.tar.gz \
    && tar -xvf /opt/nexus-3.38.0-01-unix.tar.gz -C /opt \
    && rm /opt/nexus-3.38.0-01-unix.tar.gz

RUN chown ubuntu:ubuntu /opt/nexus-3.38.0-01 -R

# RUN apt update

# Command to run when the container starts (optional)
CMD ["/bin/bash"]
