function [Yp] = erg1c(w1,w2,b,X1,X2,Yk)

W=[w1;w2;]; %dhmiourgia pinaka sunapsewn
Xk=[X1,X2]; %dedomena eisodou

Yp=sign(Xk*W+b); %ypologismos ths problepomenhs klashs
end