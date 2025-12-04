randn('state',100)
t=1;
n=300;
dt=t/n;

dw=sqrt(dt)*randn(1,n);
w=cumsum(dw);

mu=2;
sigma=1;
x0=1;

xexact=x0+mu*([dt:dt:t])+sigma*w;
plot([0:dt:t],[x0,xexact],'b')
hold on

r=3;
Dt=r*dt;
l=n/r;

xem=zeros(1,l);
xt=x0;

for j=1:l
    dwt=sum(dw(r*(j-1)+1:r*j));
    xt=xt+mu*Dt+sigma*dwt;
    xem(j)=xt;
end
plot([0:Dt:t],[x0,xem],'--r')
legend('exact','euler maryama')