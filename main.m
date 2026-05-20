clc; clear; close all;

D = [122 139 0.115;
     114 126 0.120;
     086 090 0.105;
     134 144 0.090;
     146 163 0.100;
     107 136 0.120;
     068 061 0.105;
     117 062 0.080;
     071 041 0.100;
     098 120 0.115];

x1 = D(:,1);
x2 = D(:,2);
y  = D(:,3);

n = rows(D);
lambda = 0.001;
X = [ones(n,1), x1, x2];

% Plot da base
figure;
scatter3(x1, x2, y, 70, "filled");
grid on;
xlabel("x1");
ylabel("x2");
zlabel("y");
title("Base de dados original");
view(45, 25);

% Cálculo da regressão

I = eye(columns(X));
beta = (X' * X + lambda * I) \ (X' * y);
y_hat = X * beta;
SQE = sum((y - y_hat).^2);
Syy = sum((y - mean(y)).^2);
R2 = 1 - SQE/Syy;

printf("=== Saída dos dados ===\n");
printf("beta0 = %.10f\n", beta(1));
printf("beta1 = %.10f\n", beta(2));
printf("beta2 = %.10f\n", beta(3));
printf("R2    = %.10f\n\n", R2);


x1_min = min(x1);
x1_max = max(x1);
x2_min = min(x2);
x2_max = max(x2);

[x1_grid, x2_grid] = meshgrid(linspace(x1_min, x1_max, 20), linspace(x2_min, x2_max, 20));

y_grid = beta(1) + beta(2)*x1_grid + beta(3)*x2_grid;


% Plot do plano

figure;
scatter3(x1, x2, y, 70, "filled");
hold on;
mesh(x1_grid, x2_grid, y_grid);
grid on;
xlabel("x1");
ylabel("x2");
zlabel("y");
title("Regressao multipla");
legend("Dados", "Plano ajustado");
view(45, 25);


