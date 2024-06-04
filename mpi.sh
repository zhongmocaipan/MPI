# mpi.sh
#!/bin/sh
#PBS -N test         
#PBS -l nodes=node1_vir6+node1_vir7                                      


pssh -h $PBS_NODEFILE mkdir -p /home/s2213925/lab5/groebner 1>&2

scp master:/home/s2213925/lab5/groebner/test200 /home/s2213925/lab5/groebner 
scp master:/home/s2213925/lab5/groebner/test300 /home/s2213925/lab5/groebner 
scp master:/home/s2213925/lab5/groebner/test400 /home/s2213925/lab5/groebner 
scp master:/home/s2213925/lab5/groebner/test500 /home/s2213925/lab5/groebner 
scp master:/home/s2213925/lab5/groebner/test600 /home/s2213925/lab5/groebner 
scp master:/home/s2213925/lab5/groebner/test700 /home/s2213925/lab5/groebner 
scp master:/home/s2213925/lab5/groebner/test800 /home/s2213925/lab5/groebner 
scp master:/home/s2213925/lab5/groebner/test900 /home/s2213925/lab5/groebner 



pscp -h $PBS_NODEFILE /home/s2213925/lab5/groebner/test200 /home/s2213925/lab5/groebner 1>&2 
pscp -h $PBS_NODEFILE /home/s2213925/lab5/groebner/test300 /home/s2213925/lab5/groebner 1>&2 
pscp -h $PBS_NODEFILE /home/s2213925/lab5/groebner/test400 /home/s2213925/lab5/groebner 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/groebner/test500 /home/s2213925/lab5/groebner 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/groebner/test600 /home/s2213925/lab5/groebner 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/groebner/test700 /home/s2213925/lab5/groebner 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/groebner/test800 /home/s2213925/lab5/groebner 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/groebner/test900 /home/s2213925/lab5/groebner 1>&2



mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/groebner/test200
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/groebner/test300
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/groebner/test400
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/groebner/test500
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/groebner/test600
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/groebner/test700
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/groebner/test800
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/groebner/test900

