FROM ubuntu:18.04

# The directory inside the image:
WORKDIR /root

# Create a tmp directory in the user directory:
RUN mkdir tmp
# Create a directory for binaries and scripts in the user directory:
RUN mkdir bin

# Copy update script into target system:
COPY updatesystem.sh tmp/

# Update ubuntu with all tools we need:
RUN tmp/updatesystem.sh
