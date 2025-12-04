%7
a=10;
b=1;
tspan=[0 10];
s0=0.9;
i0=0.1;
r0=0;
y0=[s0 i0 r0];

odefun=@(t,y)[-a*y(1)*y(2);a*y(1)*y(2)-b*y(2);b*y(2)];
[t, sol]=ode45(odefun,tspan,y0);
plot(t,sol(:,1),t,sol(:,2),t,sol(:,3),'linewidth',3)
xlabel('time');ylabel('population')
legend('susceptible','infected','recovered')

hold on
for a=[15 30 45]
    odefun=@(t,y)[-a*y(1)*y(2);a*y(1)*y(2)-b*y(2);b*y(2)];
    [t, sol]=ode45(odefun,tspan,y0);
    plot(t,sol(:,1),t,sol(:,2),t,sol(:,3))
    hold on
end

%% Disease free equilibrium (extra)

N = 1000; % Total population
a = 0.3; % Transmission rate
b = 0.1; % Recovery rate

% Disease-Free Equilibrium (DFE)
S_DFE = N;
I_DFE = 0;
R_DFE = 0;

fprintf('Disease-Free Equilibrium:\n S = %.2f, I = %.2f, R = %.2f\n', S_DFE, I_DFE, R_DFE);

% Endemic Equilibrium (EE) calculation
SE = (b/a)*N;
IE = N*(a-b)/a;
RE = N-SE-IE;
    fprintf('Endemic Equilibrium:\n S = %.2f, I = %.2f, R = %.2f\n', SE, IE, RE);