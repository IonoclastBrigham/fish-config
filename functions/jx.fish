function jx --description 'Picks an appropriate number of parallel build jobs'
	set -l os (uname -s)
    if [ Darwin = $os ]
        set cores (system_profiler -detailLevel full SPHardwareDataType | awk '/Total Number of Cores:/ {print $5}')
    else if [ Linux = $os ]
        set -l cpus (math (ll /dev/cpu | tail -n 1 | awk '{print $9}') + 1)
        set -l coreseach (grep -m1 cores /proc/cpuinfo | awk '{print $4}')
        set cores (math $cpus '*' $coreseach)
    end

    echo -n -j(math $cores '*' 2)
end
