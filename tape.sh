#! /bin/bash
echo '     _                                        '
echo '    | |                                       '         
echo '    | |                                       '
echo '   _| |_   ______     _________     ______    '
echo '  /_   _\ /  __  |   |   ____  \   / ____ \   '
echo '    | |   | |  | |   |  |    \  | | (____) |  '
echo '    | |   | |  | |   |  |     | | | _______|  '
echo '    | |   \ \__| \_  |  |____/  | | |_______  '
echo '     \_\   \_______| |  _______/   \_______/  '
echo '                     | |                      '
echo '                     | |                      '
echo '                     |_|                      '


echo ''
                      
avgsiglev=0
iface=$1
network=`iwconfig $iface`
network=${network##*ESSID:}
network=${network%Mode*}
echo 'Connected to' $network
echo ''
echo 'signal level	power	  frequency	distance from router ' 
while true 
do 
for i in `seq 1000`
do
config=`iwconfig $iface`
siglev=${config##*level=}
siglev=${siglev%dBm*} # signal level

avgsiglev=`echo $(($avgsiglev+$siglev))` 
done
avgsiglev=`echo $(($avgsiglev/1000))`


freq=${config##*Frequency:}
freq=${freq%GHz*} 
freq=`python -c "print $freq*1000"`

 
power=${config##*Tx-Power=}
power=${power%dBm*}
power=${power%dBm*}  # transmitter power

python log.py $avgsiglev $freq $power

done

