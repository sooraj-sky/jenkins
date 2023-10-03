FROM jenkins/jenkins:jdk11
# Switch to the root user for installation
USER root
RUN apt-get update -y \
    && apt-get install -y vim python3-pip leiningen libpq-dev python3-dev gcc
COPY requirements.txt /tmp/requirements.txt
RUN rm /usr/lib/python3.11/EXTERNALLY-MANAGED
# Install Python packages from requirements.txt
RUN pip3 install -r /tmp/requirements.txt
# Switch back to the Jenkins user
USER jenkins
# Expose the Jenkins agent port
EXPOSE 50000
