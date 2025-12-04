%1(b)
c = [-3; -2; 2]; %minimizing the max prb by -1 multiplication
a = [2, 1, 1; -1, -2, 1];    % x1+2*x2-x3 >= 3 --> -x1-2*x2+x3 <= -3
b = [8; -3];
alpha = 1;
beta = 1;
lb = [1; 0; 2*beta];
ub = [3*alpha; 3; Inf];      %infinity

[x, z] = linprog(c, a, b, [], [], lb, ub);
sprintf('x1 = %f\n  x2 = %f\n  x3 = %f\n  maxz = %f\n',x(1),x(2),x(3),-z)

results = [];
for alpha = 1:0.5:5
for beta = 1:0.5:3
lb = [1; 0; 2*beta];
ub = [3*alpha; 3; Inf];
[x, z] = linprog(c, a, b, [], [], lb, ub);
results = [results; alpha, beta, x', -z];  %for concatenating into new row
end
end
array2table(results,'VariableNames', {'alpha', 'beta', 'x1', 'x2', 'x3', 'Maxz'})

lb = [1; 0; 2];        %beta=1
ub = [3; Inf; Inf];    % Remove  upper bound on x2
[x, z] = linprog(c, a, b, [], [], lb, ub);
sprintf(' x1s = %f\n  x2s = %f\n  x3s = %f\n  maxzs = %f\n',x(1),x(2),x(3),-z)   % -z careful

[x1, x2] = meshgrid(0:0.1:10, 0:0.1:10);
x3 = zeros(size(x1));      % Assume x3 = 0 for 2D projection
C1 = 2*x1 + x2 + x3 <= 8;
C2 = x1 + 2*x2 - x3 >= 3;
feasible_area = C1 & C2;
surf(x1, x2, double(feasible_area), 'EdgeColor', 'none');
xlabel('x1');ylabel('x2');zlabel('Feasibility');