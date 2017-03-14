import math
import sys
siglev=sys.argv[1] 


freq=sys.argv[2]
agtx=0
agrx=0
prx=0
power=sys.argv[3]
fspl=float(power)+float(agtx)+float(agrx)-float(prx)

exp=pow(10,((27.55-(20*math.log10(float(freq)))+float(siglev)))/20)

print  ' ',siglev,'dBm ','    ',power,'dBm ',' ',freq,'MHz ' ,'  ',exp,'m' '\r',
