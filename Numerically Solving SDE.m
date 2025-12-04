randn('state',100)
t=1;  %interval 0 to 1
n=256; 
dt=t/n;

dw=sqrt(dt)*randn(1,n);
w=cumsum(dw);

mu=2;
sigma=1;
x0=1;
xexact=x0*exp((mu-0.5*sigma^2)*([dt:dt:t])+sigma*w);
plot([0:dt:t],[x0,xexact],'b')
hold on

r=4;
Dt=r*dt;
l=n/r;
xem=zeros(1,l);
xt=x0;

for j=1:l
    dwt=sum(dw(r*(j-1)+1:r*j));
    xt=xt+mu*xt*Dt+sigma*xt*dwt;
    xem(j)=xt;
end
plot([0:Dt:t],[x0,xem],'--r')
legend('exact','euler maryama')

error=abs(xem(end)-xexact(end)); %extra

%% for varying N (extra)
randn('state',100)
for n=[100 200 400]
 t=1;
dt=t/n;

dw=sqrt(dt)*randn(1,n);
w=cumsum(dw);

mu=2;
sigma=1;
x0=1;
xexact=x0*exp((mu-0.5*sigma^2)*([dt:dt:t])+sigma*w);
plot([0:dt:t],[x0,xexact])
hold on

r=4;
Dt=r*dt;
l=n/r;
xem=zeros(1,l);
xt=x0;

for j=1:l
    dwt=sum(dw(r*(j-1)+1:r*j));
    xt=xt+mu*xt*Dt+sigma*xt*dwt;
    xem(j)=xt;
end
plot([0:Dt:t],[x0,xem],'--')
legend('exact 100','euler maryama 100','exact 200','euler maryama 200','exact 400','euler maryama 400')
end