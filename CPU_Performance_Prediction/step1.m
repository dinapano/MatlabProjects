function [A,b,Yp,mare,r2] = erg2a(x,y)
p=209; %to sunolo twn dedomenwn
X=[x,ones(p,1)]; %o pinakas pou apoteleitai apo to ginomeno
                 %tou anastrofou X pinaka epi ton pinaka sundiasporas
                 %anaparista ta xarakthristika tou epeksergasth
Y=y; %h sxetikh apodosh tou epeksergasth

A=(inv((X')*X))*(X')*Y %suntelesths a
b=A(7,1) %statheros oros pou einai to telutaio stoixeio tou pinaka A
Yp=X*A %problepseis gia ola ta diathesima dedomena

mare=100*((sum((abs(Y-Yp))./Y))/p) %meso apoluto sxetiko sfalma

ym=(sum(Y))/p; %mesos oros sxetikhs apodoshs tou epksergasth
sse=sum((Y-Yp).^2); %apostash problepsewn apo tis metrhseis
sst=sum((Y-ym).^2); %apostash twn metrhsewn apo ton meso oro tous
r=sqrt(1-(sse/sst));
r2=r.^2  %suntelesths susxetishs
end