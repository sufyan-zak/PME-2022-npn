function [ae]=Nk_Ni_Nj_int(xt,i)

% Element Length
Le=xt(2)-xt(1);

if Le<0 
   fprintf('Negative Length of the Line Element\n');
end


% Integral contributions
% first1=1/12*psi(Ne);
% first2=1/4*psi(Ne+1);
% first3=1/12*psi(Ne+2);
% diag = first1 + first2 + first3;
% sing = first1 + first3;

a11=1/4*psi(i)+1/12*psi(i+1)    %e^psi-e^-psi
a12=1/12*psi(i)+1/12*psi(i+1)
a21=1/12*psi(i)+1/12*psi(i+1)
a22=1/12*psi(i)+1/4*psi(i+1)

ae(1:2,1)=Le*[a11,a21]';
ae(1:2,2)=Le*[a12,a22]';

return;