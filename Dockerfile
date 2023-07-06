FROM rockylinux:8

LABEL org.opencontainers.image.source="https://github.com/stackhpc/slurm-docker-cluster" \
      org.opencontainers.image.title="slurm-docker-cluster" \
      org.opencontainers.image.description="Slurm Docker cluster on Rocky Linux 8" \
      org.label-schema.docker.cmd="docker-compose up -d" \
      maintainer="StackHPC"

RUN set -ex \
    && dnf makecache \
    && dnf -y update \
    && dnf install -y dnf-plugins-core epel-release \
    && dnf install -y \
        git \
        apptainer \
        python3.9 \
        mpitests-openmpi \
        mpitests-mvapich2 \
        mpitests-mvapich2-psm2 \
        mpitests-mvapich2 \
    && dnf clean all \
    && rm -rf /var/cache/dnf
