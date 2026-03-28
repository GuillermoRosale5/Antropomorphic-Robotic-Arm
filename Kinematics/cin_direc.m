%Funcion parámetros cinemática directa

function [A] = cin_direc(q)
% recibe el vector de los angulos de las articulaciones
L1=0.105;
L2=0.12;
L3=0.082;
L4=0.14;
Lt = L1 + L2 + L3 +L4;

A10=parDH((q(1)*pi)/180,L1,0,(pi/2));
A21=parDH((q(2)*pi)/180,0,L2,0);
A32=parDH(((q(3)*pi)/180),0,L3,0);
A43=parDH((q(4)*pi)/180,0,L4,0);

A20 = A10*A21; 
A30 = A10*A21*A32;
A40 = A10*A21*A32*A43;

A = A40;
A0 = eye(4);

sist_coor(A0,0.15*Lt,['X0' 'Y0' 'Z0']);
hold on
sist_coor(A10,0.15*Lt,['X1' 'Y1' 'Z1']);
hold on
sist_coor(A20,0.15*Lt,['X2','Y2','Z2']);
hold on
sist_coor(A30,0.15*Lt,['X3','Y3','Z3']);
hold on
sist_coor(A40,0.15*Lt,['X4','Y4','Z4']);
hold on


linea([0 0 0], A10(1:3,4), [0 0 0], 3);
hold on
linea(A10(1:3,4), A20(1:3,4), [0 0 0], 3);
hold on
linea(A20(1:3,4), A30(1:3,4), [0 0 0], 3);
hold on
linea(A30(1:3,4), A40(1:3,4), [0 0 0], 3);
hold on

axis([0 Lt + (0.2*Lt), -(Lt + (0.2*Lt)) Lt + (0.2*Lt), 0, Lt + (0.2*Lt)])
end

