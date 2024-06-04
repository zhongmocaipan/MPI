# mpi.sh
#!/bin/sh
#PBS -N test         
#PBS -l nodes=node1_vir6+node1_vir7                                      


pssh -h $PBS_NODEFILE mkdir -p /home/s2213925/lab5/normal 1>&2

scp master:/home/s2213925/lab5/normal/test100 /home/s2213925/lab5/normal 
scp master:/home/s2213925/lab5/normal/test200 /home/s2213925/lab5/normal 
scp master:/home/s2213925/lab5/normal/test300 /home/s2213925/lab5/normal 
scp master:/home/s2213925/lab5/normal/test400 /home/s2213925/lab5/normal 
scp master:/home/s2213925/lab5/normal/test500 /home/s2213925/lab5/normal 
scp master:/home/s2213925/lab5/normal/test600 /home/s2213925/lab5/normal 
scp master:/home/s2213925/lab5/normal/test700 /home/s2213925/lab5/normal 
scp master:/home/s2213925/lab5/normal/test800 /home/s2213925/lab5/normal 
scp master:/home/s2213925/lab5/normal/test900 /home/s2213925/lab5/normal 
scp master:/home/s2213925/lab5/normal/test1000 /home/s2213925/lab5/normal 
scp master:/home/s2213925/lab5/normal/test2000 /home/s2213925/lab5/normal 
scp master:/home/s2213925/lab5/normal/test3000 /home/s2213925/lab5/normal 
scp master:/home/s2213925/lab5/normal/test4000 /home/s2213925/lab5/normal 
scp master:/home/s2213925/lab5/normal/test5000 /home/s2213925/lab5/normal 
scp master:/home/s2213925/lab5/normal/test6000 /home/s2213925/lab5/normal 
scp master:/home/s2213925/lab5/normal/test7000 /home/s2213925/lab5/normal 
scp master:/home/s2213925/lab5/normal/test8000 /home/s2213925/lab5/normal 
scp master:/home/s2213925/lab5/normal/test9000 /home/s2213925/lab5/normal 
scp master:/home/s2213925/lab5/normal/test10000 /home/s2213925/lab5/normal 

pscp -h $PBS_NODEFILE /home/s2213925/lab5/normal/test100 /home/s2213925/lab5/normal 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/normal/test200 /home/s2213925/lab5/normal 1>&2 
pscp -h $PBS_NODEFILE /home/s2213925/lab5/normal/test300 /home/s2213925/lab5/normal 1>&2 
pscp -h $PBS_NODEFILE /home/s2213925/lab5/normal/test400 /home/s2213925/lab5/normal 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/normal/test500 /home/s2213925/lab5/normal 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/normal/test600 /home/s2213925/lab5/normal 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/normal/test700 /home/s2213925/lab5/normal 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/normal/test800 /home/s2213925/lab5/normal 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/normal/test900 /home/s2213925/lab5/normal 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/normal/test1000 /home/s2213925/lab5/normal 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/normal/test2000 /home/s2213925/lab5/normal 1>&2 
pscp -h $PBS_NODEFILE /home/s2213925/lab5/normal/test3000 /home/s2213925/lab5/normal 1>&2 
pscp -h $PBS_NODEFILE /home/s2213925/lab5/normal/test4000 /home/s2213925/lab5/normal 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/normal/test5000 /home/s2213925/lab5/normal 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/normal/test6000 /home/s2213925/lab5/normal 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/normal/test7000 /home/s2213925/lab5/normal 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/normal/test8000 /home/s2213925/lab5/normal 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/normal/test9000 /home/s2213925/lab5/normal 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/normal/test10000 /home/s2213925/lab5/normal 1>&2

mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/normal/test100
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/normal/test200
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/normal/test300
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/normal/test400
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/normal/test500
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/normal/test600
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/normal/test700
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/normal/test800
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/normal/test900
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/normal/test1000
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/normal/test2000
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/normal/test3000
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/normal/test4000
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/normal/test5000
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/normal/test6000
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/normal/test7000
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/normal/test8000
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/normal/test9000
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/normal/test10000
