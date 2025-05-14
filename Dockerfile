###############################################
# BASE IMAGE
###############################################
# TODO: Choose appropriate base image
# FROM <base-image>:<tag>

###############################################
# WORKING DIRECTORY
###############################################
# BASE IMAGE
###############################################
# TODO: Choose appropriate base image
# FROM <base-image>:<tag>

###############################################
# WORKING DIRECTORY
###############################################
# Set working directory, the repo should always be cloned into /app
# DO NOT MODIFY THIS SECTION
RUN mkdir /app
WORKDIR /app

###############################################
# SYSTEM DEPENDENCIES
###############################################
# TODO: Install required system dependencies
# TODO: Setup basic Python environment which is needed for final post-processing and scoring
# NOTE: The following Python packages are required:
# - python3
# - python3-pip
# - python3-setuptools
# - python-is-python3
#
# Example (Debian-based image): Install common tools + Python
# RUN apt-get update && apt-get install -y --no-install-recommends \
#     git \
#     python3 \
#     python3-pip \
#     python3-setuptools \
#     python-is-python3 \
#     <other-required-packages> \
#     && apt-get clean && rm -rf /var/lib/apt/lists/*


###############################################
# REPO SETUP
###############################################
# TODO: Clone repository, follow the template below
RUN git clone <repository-url> .
# RUN git submodule update --init --recursive

# Freeze the repository to a reproducible state.
# Use one of the two approaches below depending on the task version:

# - If the task version is "latest" or there is no specified version, freeze to the latest commit before a given date:
# RUN LATEST_COMMIT=$(git rev-list -n 1 --before="2025-03-28" HEAD) && git reset --hard $LATEST_COMMIT

# - If the task version is NOT "latest" (e.g., a specific commit hash), pin to a specific commit explicitly (use this only when needed):
# RUN git checkout <commit-sha-or-tag>


###############################################
# PROJECT DEPENDENCIES AND CONFIGURATION
###############################################
COPY ./build.sh /build.sh
RUN chmod +x /build.sh
RUN /build.sh

###############################################
# ENTRYPOINT / CMD
###############################################
# ENTRYPOINT should always be /bin/bash. If the build and test commands are set as CMD or ENTRYPOINT,
# convert them to RUN commands and move them to the previous sections.
ENTRYPOINT ["/bin/bash"]