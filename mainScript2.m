D=importdata('cell cycle data1.csv');
params=D.data;
Dmean1=[];
for i=1:3:28
Dmean1=[Dmean1 mean(params(:,i:i+2),2)];
end
% Dmean(:,1:5)=Dmean1(:,[1 3 5 7 9]);
% Dmean(:,6:10)=Dmean1(:,[2 4 6 8 10]);
% Dmean=zscore(Dmean1(:,[1 2 5 6 7 8]),[],2)+5;
Dmean=(Dmean1(:,[1 2 5 6 7 8]));
% Dmean=zscore(Dmean1(:,[3 4 9 10]),[],2);
% Dmean=zscore(Dmean1,[],2);
% t=[-1 1 -1 1 -1 1];
% t=[-1 1 -1 1];
t=[1 -1 1 -1 1 -1];
% t=[1 -1 1 -1];
% t=[1 1 1 1 1 1 1 1 1 1];
k=0;
y=[];
x={};
for i=1:size(Dmean,1)
    r=corrcoef(Dmean(i,:),t);
    e=r(1,2);
    if e>=0.78
        k=k+1;
   y(k,:)=Dmean(i,:);
   x(k,:)=D.textdata(i,1);
    end
end
err=max(y)-min(y);
err=0.5*err;
% plot(t,'--','LineWidth',2.5)
stairs(0.5:size(t,2)+0.5,[t-2 1-2],'-','LineWidth',3.5);
hold on
grid on
% errorbar(median(y),err,'LineWidth',2.5)
% boxplot(y)
 b=bar(y');
 legend(['Pattern Curve';x],'Location','Best')
%  stairs(z,'DisplayName','z')
 ylabel('Expression Value')
% c = categorical({'apples','pears','oranges'});
% prices = [1.23 0.99 2.3];
% bar(c,prices)