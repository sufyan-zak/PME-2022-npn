% This subroutine imposes boundary conditions
% August 12, 2019
% Source: 01_Electrostatic_Analysis_1D.docx

delta1=0;
delta2=0;
% Left: Dirichlet BC (x=0)
A(1,1:Nn)=0;A(1,1)=1;b(1)=delta_1;

% Right: Dirichlet BC (x=2*L)
A(Nn,1:Nn)=0;A(Nn,Nn)=1;b(Nn)=delta_2;
