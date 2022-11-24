% Calculation Parameters

% % Parameters of Air 
% mu_r_a=1;
% sig_a=0;
% eps_r_a=1;
% rho_a=1e-7;      % charge density (C/m^3)
% 
% % Parameters of Insulator
% mu_r_i=1;
% sig_i=0;
% eps_r_i=2;
% rho_i=0;        % charge density (C/m^3)
% 
% % Boundary Conditions (Dirichlet)
% phi_1=1.5;
% phi_2=0;
% 
% mu_r=zeros(Ne_1d,1);
% sig=zeros(Ne_1d,1);
% eps_r=zeros(Ne_1d,1);
% rho=zeros(Ne_1d,1);

%% np
n_i = 8.3e15;   %intrinsic carrier concentration at 298.15K     
% Parameters of n-doped
N_D = 1e17;
% Parameters of p-doped
N_A = -1e16;

N_doping = zeros(Ne_1d,1);

for i=1:Ne_1d
   if x_ec(i)<L_a % n
       N_doping(i) = N_D/n_i;
%        mu_r(i)=mu_r_a;
%        sig(i)=sig_a;
%        eps_r(i)=eps_r_a;
%        rho(i)=rho_a;
   end
   if x_ec(i)>L_a % p
       N_doping(i) = N_A/n_i;
%        mu_r(i)=mu_r_i;
%        sig(i)=sig_i;
%        eps_r(i)=eps_r_i;
%        rho(i)=rho_i;
   end

   % Boundary conditions
    q = 1.6e-19;
    k = 1.38e-23;
    T = 298.15;
    V1 = 0;     %will have to change to V_EB
    V2 = 0;     %change to V_CB
    phi_1 = q*V1/(k*T);
    phi_2 = q*V2/(k*T);

    psi_1 = phi_1

    

end
