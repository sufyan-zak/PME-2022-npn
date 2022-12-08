% Electrostatic Solver 1-D
% Matrix Assembly
% August 12, 2019

A=sparse(Nn,Nn);        % FEM matrix
M=sparse(Nn,Nn);        % psi'' matrix
b=zeros(Nn,1);          % RHS
X=zeros(Nn,1);          % Unknown vector

for i=1:Ne_1d % Loop over 1-D elements

    nds_=el_1d_no(i,1:2);
        
    xl=x_no(nds_);
    
    ae1 = dNi_dNj_int_cont_line_Ver_1(xl); % ae(2,2)
    ae2 = Nk_Ni_Nj_int(xl,Ne_1d);
    be1 = Nk_Ni_int_cont_line_Ver_1(i, xl); % be(2,1)
    be2 = dNk_dNi_int(xl);
    
    ae=(ae1+ae2)*-1;
    be=be1-be2;
    
    A(nds_,nds_)=A(nds_,nds_)+ae;  
    b(nds_,1)=b(nds_,1)+be;
    
end % End of Loop over 1-D elements

A=A*eps_0;
