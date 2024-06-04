# mpi.sh
#!/bin/sh
#PBS -N test         
#PBS -l nodes=node1_vir6+node1_vir7                                      


pssh -h $PBS_NODEFILE mkdir -p /home/s2213925/lab5/pipeline 1>&2

scp master:/home/s2213925/lab5/pipeline/test2000 /home/s2213925/lab5/pipeline 
scp master:/home/s2213925/lab5/pipeline/test3000 /home/s2213925/lab5/pipeline 
scp master:/home/s2213925/lab5/pipeline/test4000 /home/s2213925/lab5/pipeline 
scp master:/home/s2213925/lab5/pipeline/test5000 /home/s2213925/lab5/pipeline 
scp master:/home/s2213925/lab5/pipeline/test6000 /home/s2213925/lab5/pipeline 
scp master:/home/s2213925/lab5/pipeline/test7000 /home/s2213925/lab5/pipeline 
scp master:/home/s2213925/lab5/pipeline/test8000 /home/s2213925/lab5/pipeline 
scp master:/home/s2213925/lab5/pipeline/test9000 /home/s2213925/lab5/pipeline 
scp master:/home/s2213925/lab5/pipeline/test10000 /home/s2213925/lab5/pipeline 


pscp -h $PBS_NODEFILE /home/s2213925/lab5/pipeline/test2000 /home/s2213925/lab5/pipeline 1>&2 
pscp -h $PBS_NODEFILE /home/s2213925/lab5/pipeline/test3000 /home/s2213925/lab5/pipeline 1>&2 
pscp -h $PBS_NODEFILE /home/s2213925/lab5/pipeline/test4000 /home/s2213925/lab5/pipeline 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/pipeline/test5000 /home/s2213925/lab5/pipeline 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/pipeline/test6000 /home/s2213925/lab5/pipeline 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/pipeline/test7000 /home/s2213925/lab5/pipeline 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/pipeline/test8000 /home/s2213925/lab5/pipeline 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/pipeline/test9000 /home/s2213925/lab5/pipeline 1>&2
pscp -h $PBS_NODEFILE /home/s2213925/lab5/pipeline/test10000 /home/s2213925/lab5/pipeline 1>&2


mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pipeline/test2000
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pipeline/test3000
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pipeline/test4000
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pipeline/test5000
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pipeline/test6000
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pipeline/test7000
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pipeline/test8000
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pipeline/test9000
mpiexec -np 4 -machinefile $PBS_NODEFILE /home/s2213925/lab5/pipeline/test10000
