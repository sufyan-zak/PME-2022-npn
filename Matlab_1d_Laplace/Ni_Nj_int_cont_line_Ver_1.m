function [ce]=Ni_Nj_int_cont_line_Ver_1(xt)
% Integral contribution of a scalar (nodal) line (1-D)
% integral: int(Ni*Nj*dL)
% analytical method (Jasmin, FEM_Integral_Contributions_1D.docx)
% Input: 
% xt(2,1) - nodal coordinates of the line element
% Output
% ce(2,2) - integral contributions of the line element

% Element Length
Le=xt(2)-xt(1);

if Le<0 
   fprintf('Negative Length of the Line Element\n');
end

% Integral contributions
ce(1,1:2)=Le/6*[2,1];
ce(2,1:2)=Le/6*[1,2];

return;
