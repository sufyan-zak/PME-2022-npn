function [ae]=Nk_Ni_Nj_int(xl,Ne)

% Element Length
Le=xt(2)-xt(1);

if Le<0 
   fprintf('Negative Length of the Line Element\n');
end


% Integral contributions
first1=1/12*psi(Ne);
first2=1/4*psi(Ne+1);
first3=1/12*psi(Ne+2);
diag = first1 + first2 + first3;
sing = first1 + first3;

ae(1:2,1)=Le*[diag,sing]';
ae(1:2,2)=Le*[sing,diag]';

return;