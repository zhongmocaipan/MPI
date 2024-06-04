# mpi.sh
#!/bin/sh
#PBS -N test         
#PBS -l nodes=node1_vir9+node1_vir10+node1_vir11+node1_vir1                                  

pssh -h $PBS_NODEFILE mkdir -p /home/s2213925/lab5/pthread_mpi 1>&2

scp master:/home/s2213925/lab5/pthread_mpi/test100 /home/s2213925/lab5/pthread_mpi 
scp master:/home/s2213925/lab5/pthread_mpi/test200 /home/s2213925/lab5/pthread_mpi 
scp master:/home/s2213925/lab5/pthread_mpi/test300 /home/s2213925/lab5/pthread_mpi 
scp master:/home/s2213925/lab5/pthread_mpi/test400 /home/s2213925/lab5/pthread_mpi 
scp master:/home/s2213925/lab5/pthread_mpi/test500 /home/s2213925/lab5/pthread_mpi 
scp master:/home/s2213925/lab5/pthread_mpi/test600 /home/s2213925/lab5/pthread_mpi 
scp master:/home/s2213925/lab5/pthread_mpi/test700 /home/s2213925/lab5/pthread_mpi 
scp master:/home/s2213925/lab5/pthread_mpi/test800 /home/s2213925/lab5/pthread_mpi 
scp master:/home/s2213925/lab5/pthread_mpi/test900 /home/s2213925/lab5/pthread_mpi 
scp master:/home/s2213925/lab5/pthread_mpi/test1000 /home/s2213925/lab5/pthread_mpi 
scp master:/home/s2213925/lab5/pthread_mpi/test2000 /home/s2213925/lab5/pthread_mpi 
scp master:/home/s2213925/lab5/pthread_mpi/test3000 /home/s2213925/lab5/pthread_mpi 
scp master:/home/s2213925/lab5/pthread_mpi/test4000 /home/s2213925/lab5/pthread_mpi 
scp master:/home/s2213925/lab5/pthread_mpi/test5000 /home/s2213925/lab5/pthread_mpi 
scp master:/home/s2213925/lab5/pthread_mpi/test6000 /home/s2213925/lab5/pthread_mpi 
scp master:/home/s2213925/lab5/pthread_mpi/test7000 /home/s2213925/lab5/pthread_mpi 
scp master:/home/s2213925/lab5/pthread_mpi/test8000 /home/s2213925/lab5/pthread_mpi 
scp master:/home/s2213925/lab5/pthread_mpi/test9000 /home/s2213925/lab5/pthread_mpi 

pscp -h $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test100 /home/s2213925/lab5/pthread_mpi 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test200 /home/s2213925/lab5/pthread_mpi 1>&2 
pscp -h $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test300 /home/s2213925/lab5/pthread_mpi 1>&2 
pscp -h $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test400 /home/s2213925/lab5/pthread_mpi 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test500 /home/s2213925/lab5/pthread_mpi 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test600 /home/s2213925/lab5/pthread_mpi 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test700 /home/s2213925/lab5/pthread_mpi 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test800 /home/s2213925/lab5/pthread_mpi 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test900 /home/s2213925/lab5/pthread_mpi 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test1000 /home/s2213925/lab5/pthread_mpi 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test2000 /home/s2213925/lab5/pthread_mpi 1>&2 
pscp -h $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test3000 /home/s2213925/lab5/pthread_mpi 1>&2 
pscp -h $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test4000 /home/s2213925/lab5/pthread_mpi 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test5000 /home/s2213925/lab5/pthread_mpi 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test6000 /home/s2213925/lab5/pthread_mpi 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test7000 /home/s2213925/lab5/pthread_mpi 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test8000 /home/s2213925/lab5/pthread_mpi 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test9000 /home/s2213925/lab5/pthread_mpi 1>&2

mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test100
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test200
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test300
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test400
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test500
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test600
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test700
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test800
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test900
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test1000
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test2000
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test3000
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test4000
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test5000
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test6000
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test7000
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test8000
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pthread_mpi/test9000
