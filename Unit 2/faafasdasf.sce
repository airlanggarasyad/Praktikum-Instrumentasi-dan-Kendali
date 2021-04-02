clear
clc

num=poly([1 0 0],'s','coeff');
den=poly([1 1 0],'s','coeff');
t=0:0.005:5;
g=syslin('c',num/den);
gs=csim('step',t,g);
r=1;

while gs(r)<0.9;
r=r+1;
end;

risetime=(r-1)*0.005;
[gsmax,rp]=max(gs);
peaktime=(rp-1)*0.005;
Maxshoot=gsmax-1;
rmax=5/0.005;
k=rmax+1;

while gs(k)>0.98 & gs(k)<1.02;
k=k-1;
end;

settlingtime=(k-1)*0.005;

Maxshoot
risetime
peaktime
settlingtime
