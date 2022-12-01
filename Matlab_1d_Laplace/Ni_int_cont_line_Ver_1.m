function [be]=Ni_int_cont_line_Ver_1(i, xt)
% Integral contribution of a scalar (nodal) line (1-D)
% integral: int(Ni*dL)
% analytical method (Jasmin, FEM_Integral_Contributions_1D.docx)
% Input: 
% xt(2,1) - nodal coordinates of the line element
% Output
% be(2,1) - integral contributions of the line element

% Element Length
Le=xt(2)-xt(1);

if Le<0 
   fprintf('Negative Length of the Line Element\n');
end

% Integral contributions
k = N_doping(i) + exp(psi(i)) - exp(-psi(i)) % + V'' !!!!
be(1:2,1)=k*Le/2*[1,1]';

return;
