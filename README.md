# mpitests-container

Provides a RockyLinux 8 container image with MPI libraries, Intel MPI Benchmarks (IMB) and OSU Micro Benchmarks (OMB), for use with with Singularity/Apptainer to provide MPI tests on clusters.

Currently the image it contains the following packages:

        git
        python3.9 
        mpitests-mpich
        mpitests-mvapich2
        mpitests-mvapich2-psm2
        mpitests-openmpi

Note the `mpitests-*` packages provide binaries for IMB, OMB and the relevant MPI library in a directory derived from the package name. For example for `mpitests-openmpi` the directory `/usr/lib64/openmpi/bin/` contains the OpenMPI `mpirun` binary plus `mpitests-IMB-MPI1`, `mpitests-osu_bw` and others.

Example of running IMB-MPI1 pingpong using OpenMPI under Slurm using `srun` as the launcher:

    #SBATCH -N2
    #SBATCH --ntasks-per-node=1
    MPI_CONTAINER_TAG="main"
    echo SLURM_JOB_NAME: $SLURM_JOB_NAME
    echo $SLURM_JOB_ID: $SLURM_JOB_NODELIST
    srun singularity exec docker://ghcr.io/stackhpc/mpitests-container:${MPI_CONTAINER_TAG} /usr/lib64/openmpi/bin/mpitests-IMB-MPI1 pingpong
