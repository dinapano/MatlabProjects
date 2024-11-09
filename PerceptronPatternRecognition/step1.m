function [w1,w2,b] = erg1a(x1,x2,yk) %opou x1 o arithmos pixel mias eikonas
                                     %x2 h diaspora kai yk h klash 1 h -1
                                     %w1,w2 oi sunapseis kai b h polwsh
w=rand(1,3); %oi sunapseis kai h polwsh topothetounttai se auto to dianusma
W=w'; % kai anastrofh tou dianusmatos w
n=rand(1,1); %ruthmos mathhshs pou pairnei times metaksu 0 kai 1
len=59; % plhthos stoixeiwn 
xk=[x1,x2,ones(len,1)]; %kathe dedomeno eisodou topotheteitai se ena dianusma

a=false; %logikh synthhkh gia na trexei to while loop
%anaparastash perceptron
 while ~a
   yp=sign(xk*W); %problepsh tou perceptron
   a=isequal(yp,yk); %sugkrish pragmatikwn timwn me autes tou perceptron
   for i=1:59
       W=W+n*(yk(i)-yp(i))*(xk(i,:))'; %diorthwsh sunapsewn me bash 
                                       % ton kanona Widrow-Hoff
   end
 end

w1=W(1);
w2=W(2);
b=W(3);
end