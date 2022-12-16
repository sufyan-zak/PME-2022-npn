function [d_psi]=compute_d2psi_dx2(psi,el_1d_no,x_no_n)

% Input
% psi(Nn,1) - normalized potential
% x_no_n(Nn,1) - normalized nodal coordinates
% Output
% d_psi(Nn,1) - derivative of the potential d2_psi/dx2
% Source: 04_Single_intrinsic_Si_block.docx

[Ne,m]=size(el_1d_no);

d_psi=zeros(Ne,1);

% psi_temp=psi;
% psi_temp(Ne+1)=psi_temp(Ne);

for i=1:Ne-1
    no1=el_1d_no(i,1);no2=el_1d_no(i,2);no3=el_1d_no(i,2)+1;
    x1=x_no_n(no1);x2=x_no_n(no2);
    psi1=psi(no1);psi2=psi(no2);psi3=psi(no3);
    d_psi(i)=(psi3-2*psi2+psi1)/(x2-x1)^2;
end
d_psi(Ne+1)=d_psi(Ne);

