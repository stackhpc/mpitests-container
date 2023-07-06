FROM rockylinux:8

LABEL org.opencontainers.image.source="https://github.com/stackhpc/mpitests-container" \
      org.opencontainers.image.title="mpitests-container" \
      org.opencontainers.image.description="RockyLinux mpitests-* packages" \
      maintainer="StackHPC"

RUN set -ex \
    && dnf makecache \
    && dnf -y update \
    && dnf install -y dnf-plugins-core epel-release \
    && dnf install -y \
        git \
        python3.9 \
        mpitests-mpich \
        mpitests-mvapich2 \
        mpitests-mvapich2-psm2 \
        mpitests-openmpi \
    && dnf clean all \
    && rm -rf /var/cache/dnf
