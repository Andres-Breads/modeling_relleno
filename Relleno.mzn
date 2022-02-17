include "table.mzn";
% Cargar datos:
int: n; % Tamaño del mapa
int: m; % Número de ciudades
set of int: REGION = 0..n;
set of int: NCIUDADES = 1..m;
array[NCIUDADES, 1..2] of REGION: ciudades;

% Variables:
var 0..n: relleno_x;
var 0..n: relleno_y;
var 0..n+n: distancia;
array[1..2] of var REGION: ciudad_cercana;

% Restricciones:
constraint distancia = min(i in NCIUDADES)(
  abs(ciudades[i,1] - relleno_x) + abs(ciudades[i,2] - relleno_y)
);
constraint table(ciudad_cercana, ciudades);
constraint abs(ciudad_cercana[1] - relleno_x) + abs(ciudad_cercana[2] - relleno_y) == distancia;

% Objetivo
solve maximize distancia;