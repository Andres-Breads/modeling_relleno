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
var REGION: ciudad_cercana_x;
var REGION: ciudad_cercana_y;
%array[1..2] of var int: relleno;
%array[1..2] of var int: ciudad_cercana;

% Restricciones:
constraint distancia = min(i in NCIUDADES)(
  abs(ciudades[i,1] - relleno_x) + abs(ciudades[i,2] - relleno_y)
);
constraint forall(i in NCIUDADES)(
  if distancia = abs(relleno_x - ciudades[i,1]) + abs(relleno_y - ciudades[i,2])
  then ciudad_cercana_x = ciudades[i,1] /\ ciudad_cercana_y = ciudades[i,2]
  else true endif
);
%constraint relleno[1] = relleno_x;
%constraint relleno[2] = relleno_y;
%constraint ciudad_cercana[1] = ciudad_cercana_x;
%constraint ciudad_cercana[2] = ciudad_cercana_y;
%constraint relleno != ciudad_cercana;
%constraint relleno_x != ciudad_cercana_x \/ relleno_y != ciudad_cercana_y;

% Objetivo
solve maximize abs(relleno_x - ciudad_cercana_x) + abs(relleno_y - ciudad_cercana_y);
%solve maximize distancia;