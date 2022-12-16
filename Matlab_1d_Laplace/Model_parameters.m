% Calculation Parameters

%% npn
n_i = 8.3e15;   %intrinsic carrier concentration at 298.15K     
% Parameters of n-doped
N_D_c = 1e17;
% Parameters of p-doped
N_A = -1e16;
% Parameters of n-doped
N_D_e = 1e13;

% Boundary conditions
    q = 1.6e-19;
    k = 1.38e-23;
    T = 298.15;
    V_eb = 0;     %will have to change to V_EB
    V_cb = 0;     %change to V_CB
    phi_0 = q*V_eb/(k*T);
    phi_M = 0;
    phi_R = q*V_cb/(k*T);

N_doping = zeros(Ne_1d,1);
phi = zeros(Ne_1d,1);

   % Boundary conditions
% q = 1.6e-19;
% k = 1.38e-23;
% T = 298.15; 
% V1 = 0;     %will have to change to V_E
% V2 = 0;     %change to V_CB
% phi_1 = q*V1/(k*T);
% phi_2 = q*V2/(k*T);

% psi_1 = phi_1 - ln( sqrt((N_D/2)^2 + 1) - N_D/2)
% psi_2 = phi_2 - ln( sqrt((N_A/2)^2 + 1) - N_A/2)

for i=1:Ne_1d
   if x_ec(i)<L_a % n
       N_doping(i) = N_D_c/n_i;
       phi(i)=phi_0;
   end
   if x_ec(i)>L_a && x_ec(i)<(L_a+L_b) % p
       N_doping(i) = N_A/n_i;
       phi(i)=phi_M;
   end
   if x_ec(i)>(L_a+L_b) && x_ec(i)<(L_a+L_b+L_c) % n
       N_doping(i) = N_D_e/n_i;
       phi(i)=phi_R;
   end

end

   
   % Boundary conditions 
    psi = phi - log(sqrt(N_doping.^2+1)-N_doping./2);
    psi(Nn)=phi_R - log(sqrt(N_doping(Ne_1d)^2+1)-N_doping(Ne_1d)/2);
