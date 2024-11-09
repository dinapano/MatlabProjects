figure(1); %emfanish prwths grafikhs parastashs
plot(cpudata(:,1),cpudata(:,10),'r-'); %grafikh anaparastash twn pragmatikwn
                                         %timwn y gia ola ta diathesima
                                         %dedomena, dhladh sunarthsei tou
                                         %arithmou tou kate dedomenou
hold on
plot(cpudata(:,1),Yp,'b-');  %sto idio grafhma fainetai kai h grafikh 
                             %anaparastash twn problepsewn yp gia kathe 
                             %dedomeno
title('Αναπαράσταση των Πραγματικών Δεδομένων y & των Προβλέψεων Yp σε συνάρτηση με τα Διαθέσιμα Δεδομένα x'); 
%titlos prwths grafikhs
xlabel('x');
ylabel('y & Yp');
hold off

figure(2); %emfanish deuterhs grafikhs parastashs
plot(cpudata(:,10),Yp,'o'); % grafikh anaparastash twn pragmatikwn timwn y
                            % se sunarthsh me to yp
title('Αναπαράσταση των Προβλέψεων Yp σε συνάρτηση με τα Πραγματικά Δεδομένα y');
%titlos deuterhs grafikhs
xlabel('y');
ylabel('Yp');