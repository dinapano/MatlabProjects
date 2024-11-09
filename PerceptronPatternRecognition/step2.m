x1=data(:,2); %x1 o arithmos pixel mias eikonas
x2=data(:,3); %x2 h diaspora 
yk=data(:,4); %yk h klash 1 h -1
len=59;

hold on
for i=1:len
    if yk(i)==1
        plot(x2(i),x1(i),'b|'); %grafikh anaparastash ths mias klashs
    else
        plot(x2(i),x1(i),'rO'); %grafikh anaparastash ths allhs klashs
    end
end
hold off

hold on
X=x2;
A=-(w2/w1);
B=-(b/w1);
Y=A*X+B; %upologismos tou oriou apofashs
plot(X,Y,'k'); %grafikh anaparastash tou oriou apofashs
axis([-1,55,1,115]); %kathorismos aksonwn
xlabel('Διασπορά (x2)');
ylabel('Αριθμός Pixel (x1)');
title('Γραφική Αναπαράσταση το Ορίου Απόφασης με Βάση τον Αλγόριθμο Perceptron');
hold off
