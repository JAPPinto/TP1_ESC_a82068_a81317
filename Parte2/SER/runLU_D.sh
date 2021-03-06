cd EngSisComp/NPB3.3.1-MZ/NPB3.3-MZ-SER-O3-xHost/

module load intel/2020
module load intel/2019
module load gcc/5.3.0

make clean
make suite

mpstat -P DLL 1 > PT2/mpstat_lu_D.txt &
vmstat 1 > PT2/vmstat_lu_D.txt &
iostat -mdx 1 > PT2/iostat_lu_D.txt &
free -m -s 1 > PT2/free_lu_D.txt &
#sar -n TCP,ETCP,DEV 1 > PT2/sar_lu_D.txt &


./bin/lu-mz.D.x

>&2 jobs

kill %1
kill %2
kill %3
kill %4
#kill %5


wait

>&2 jobs
