function [net,accval,acctest,tnval,tpval,fnval,fpval,tntest,tptest,fntest,fptest] = erg2a(dat)
%tn:true negative, dhladh spam email pou kathgoriopoihthke swsta ws spam
%tp:true positive, dhladh ham email pou kathgoriopoihthke swsta ws ham (ham=non-spam)
%fn:false negative, dhladh spam email pou kathgoriopoihthke lathos ws ham
%fp:false positive, dhladh ham email pou kathgoriopoihthke lathos ws spam
%val:validation, dhladh gia ta dedomena aksiologhshs
%test:testing, dhladh gia ta dedomena elegxou
%acc:sunoliko poso email pou kathgoriopoihthhke swsta se opoiadhpote kathgoria

x=dat(:,1:57); %dedomena eisodou pou antiproswpeuoun tis 57 prwtes sthles tou pinaka dat
y=dat(:,58); %dedomena eksodou (0 h 1) gia kathgoriopoihsh spam h ham, opou 1:spam kai 0:ham

%dhmiourgia tuxaiwn timwn gia x kai y
randomnum=randperm(4601); %4601:sunolika diathesima dedomena
xrand=x(randomnum,:);
yrand=y(randomnum,:);

%dhmiourgia tou y me 2 grammes
ynew=[~yrand, yrand];

%kathgoriopoihsh twn dedomenwn eisodou kai eksodou se sunola dedomewn
%ekpaideushs, aksiologhshs,elegxou
Xrand=(xrand)' ; %anastrofh pinaka eisodou
Yrand=(ynew)' ; %anastrofh pinaka eksodou
Xrandtrain=Xrand(:,1:1840);
Xrandval=Xrand(:,1841:3220);
Xrandtest=Xrand(:,3221:4601);
Yrandtrain=Yrand(:,1:1840);
Yrandval=Yrand(:,1841:3220);
Yrandtest=Yrand(:,3221:4601);

%Kanonikopoihsh twn dedomenwn ekpaideushs, aksiologhshs kai elegxou
[Xrandtrainsc, ps_Xrandtrainsc]=mapminmax(Xrandtrain); %Kanonikopoihsh twn dedomenwn ekpaideushs
Xrandvalsc=mapminmax('apply',Xrandval,ps_Xrandtrainsc); %Kanonikopoihsh twn dedomenwn aksiologhshs
Xrandtestsc=mapminmax('apply',Xrandtest,ps_Xrandtrainsc); %Kanonikopoihsh twn dedomenwn elegxou

%dhmiourgia MLP neurwnikou diktuou
hl=[20 10]; %duo krufes stoibades opou h prwth tha exei 20 neurwnes kai h deuterh 10 neurwnes
net=patternnet(hl); %ksekinaei h dhmiourgia tou diktuou
net.divideFcn='divideind';
net.divideParam.trainInd=[1:1840];
net.divideParam.valInd=[1841:3220];
net.divideParam.testInd=[3221:4601];

Xsc=[Xrandtrainsc Xrandvalsc Xrandtestsc]; %dhmiourgia pinaka me ola ta sunola dedomenwn eisodou
                                                       %(ekpaideushs,aksiologhshs,elegxou)
Ysc=[Yrandtrain Yrandval Yrandtest]; %dhmiourgia pinaka me ola ta sunola dedomenwn ekdosou
                                   %(ekpaideushs,aksiologhshs,elegxou)
[net,tr]=train(net,Xsc,Ysc); %dhmiourgia neurwnikou diktuou pou tha ekpaideuei

%diaxwrismos tou sunolou dedomewn eksodou pou problefthhkan se sunola ekpaideushs,aksiologhshs,elegxou
Yp=(net(Xsc))';
Yp_row=(Yp(:,1)<Yp(:,2));
Yp_train=Yp_row(1:1840,:);
Yp_val=Yp_row(1841:3220,:);
Yp_test=Yp_row(3221:4601,:);

%dhmiourgia tou confusion matrix gia to sunolo dedomwn aksiologhshs
accval= 100*(sum(Yp_val == (Yrandval)'))/(length((Yrandval)'));
tnval= 100*(sum((Yp_val == 0) & ((Yrandval)' == 0)))/(length((Yrandval)'));
tpval= 100*(sum((Yp_val == 1) & ((Yrandval)' == 1)))/(length((Yrandval)'));
fnval= 100*(sum((Yp_val == 1) & ((Yrandval)' == 0)))/(length((Yrandval)'));
fpval= 100*(sum((Yp_val == 0) & ((Yrandval)' == 1)))/(length((Yrandval)'));

%dhmiourgia tou confusion matrix gia to sunolo dedomwn elegxou
acctest= 100*(sum(Yp_test == (Yrandtest)'))/(length((Yrandtest)'));
tntest= 100*(sum((Yp_test == 1) & ((Yrandtest)' == 0)))/(length((Yrandval)'));
tptest= 100*(sum((Yp_test == 1) & ((Yrandtest)' == 0)))/(length((Yrandval)'));
fntest= 100*(sum((Yp_test == 1) & ((Yrandtest)' == 0)))/(length((Yrandval)'));
fptest= 100*(sum((Yp_test == 1) & ((Yrandtest)' == 0)))/(length((Yrandval)'));

end