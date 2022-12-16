% Electrostatic 1-D, Geometry and Mesh
% August 12, 2019

L_a=1e-6;               % Length of the air block (m)
L_b=1.5e-6;               % Length of the insulator block (m)
L_c=1.5e-6;             %total=1+1.5+1.5=4

N_a=60;                 % Number of elements of the air block
N_b=60;                 % Number of element in the insulator block
N_c=60;

dx_a=L_a/N_a;           % Element length of the air
dx_b=L_b/N_b;           % Element length of the insulator
dx_c=L_c/N_c;

Ne_1d=N_a+N_b+N_c;          % Number of 1-D elements 
Nn=Ne_1d+1;             % Number of nodes     % +1 is just logic

el_1d_no=zeros(Ne_1d,2);
el_mat_1d=zeros(Ne_1d,1);
x_no=zeros(Nn,1);
x_ec=zeros(Ne_1d,1);

x_no(1)=0;
n_count=1;
e_count=0;

for i=1:N_a     %n-doped
    n_count=n_count+1;
    e_count=e_count+1;
    x_no(n_count)=x_no(n_count-1)+dx_a;
    el_1d_no(e_count,1:2)=[n_count-1,n_count];
    el_mat_1d(e_count,1)=1;
    x_ec(e_count,1)=mean([x_no(n_count-1),x_no(n_count)]);
end

for i=1:N_b     %p-doped
    n_count=n_count+1;
    e_count=e_count+1;
    x_no(n_count)=x_no(n_count-1)+dx_b;
    el_1d_no(e_count,1:2)=[n_count-1,n_count];
    el_mat_1d(e_count,1)=1;
    x_ec(e_count,1)=mean([x_no(n_count-1),x_no(n_count)]);
end

for i=1:N_c     %n-doped
    n_count=n_count+1;
    e_count=e_count+1;
    x_no(n_count)=x_no(n_count-1)+dx_c;
    el_1d_no(e_count,1:2)=[n_count-1,n_count];
    el_mat_1d(e_count,1)=1;
    x_ec(e_count,1)=mean([x_no(n_count-1),x_no(n_count)]);
end