c=200; %xronos kuklou
minm=3000; %elaxisth kentrikh mnhmh
minch=6; %elaxistos arithmos kanaliwn
maxch=16; %megistos arithmos kanaliwn

maxm=8000:16000; %metabolh megisths kentrikhs mnhmhs
cache=32:128; %metabolh cache mnhmhs

[x,y]=meshgrid(maxm,cache); %dhmiourgia 3D grafhmatos metaksu megisths mnhmhs                 
                            %kai cache mnhmhs

%upologismos apodoshs epeksergasth                            
z= (0.0489*c)+(0.0153*minm)+(0.0056*x)+(0.6414*y)+(-0.2704*minch)+(1.4825*maxch)+(-55.8939);
mesh(x,y,z); %dhmiourgia 3D grafhmatos metaksu megisths mnhmhs, cache mnhmhs
             %kai apodoshs epeksergasth

xlabel('Μέγιστη Κεντρική Μνήμη');
ylabel('Μνήμη Cache');
zlabel('Απόδοση Επεξεργαστή');