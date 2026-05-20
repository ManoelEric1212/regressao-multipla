# Regressão Linear Múltipla com e sem Regularização de Tikhonov

## Base de dados

A base `D` possui três colunas:

- Coluna 1: variável regressora `x1`
- Coluna 2: variável regressora `x2`
- Coluna 3: saída/resposta `y`

```octave
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

```

## Formulação da regressão múltipla

```math
y = β0 + β1*x_{1} + β2*x_{2} + ... + βk*x_{k} + ε
```

No caso, como no exemplo temos $k=2$, temos:

```math
y = β0 + β1*x_{1} + β2*x_{2}+ ε
```

## Formato matricial

$$y = Xβ + ε$$

- Minimizando $ε$, pelos mínimos quadráticos:

$$J(β) = {||y -Xβ||}^2$$

$$ \hat{β} ={(X^{T}X)}^{-1}X^{T}y $$

- Modelo ajustado:

$$\hat{y} = X\hat{β} $$

- Métrica de coeficiente ajustado

$$
R^2 = 1 - SQE/Syy
$$

$$SQE = \sum (y - \hat{y})^2$$
$$S_{yy} = \sum (y - \bar{y})^2$$

## Regularização de Thikonov

Para amenizar os efeitos da multicolinearidade, o que muda é um termo $0 \le \lambda << 1$, no cálculo de $\hat{β}$:

$$ \hat{β} ={(X^{T}X + \lambda I)}^{-1}X^{T}y $$

---

## Resultados

| Métrica / Parâmetro | Valor Obtido    |
| :------------------ | :-------------- |
| **$\beta_0$**       | `0.1271041374`  |
| **$\beta_1$**       | `-0.0006560711` |
| **$\beta_2$**       | `0.0004401434`  |
| **$R^2$**           | `0.7238598113`  |

- Base de dados original

![Base de dados original](/outputs/dados.jpg)

- Hiperplano

![Hiperplano](/outputs/hiperplano.jpg)
