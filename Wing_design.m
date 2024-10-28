clear
clc
clf
close all

%Finding the airofoil using cruise and loiter data
%--------------------------------------------------------------------------
%Finding the Reynold's number for each mission segment
MAC = 9.14; %Main aerodynamic chord of the 747-400 (m) (For referece)
%Cruise 1 
rho_c1 = 0.380305; %Density of air at cruise 1:35000ft(kg/m3)
u_c1 = 0.83*296.5; %Speed of air at cruise 1 (m/s-1)
dv_c1 = 0.00001445; %Dynamic viscosity of air at cruise 1 (kg/m/s) (intro to aero)
Re_c1 = (rho_c1*u_c1*MAC)/dv_c1;
disp("Reynolds number for cruise 1: "+Re_c1);

%Cruise 2
rho_c2 = 0.697; %Density of air at cruise 2:18000ft(kg/m3) found on intro to aero stuff
u_c2 = 0.83*319.634; %Speed of air at cruise 2 (m/s-1)
dv_c2 = 0.00001617; %Dynamic viscosity of air at cruise 2 (kg/m/s)
Re_c2 = (rho_c2*u_c2*MAC)/dv_c2;
disp("Reynolds number for cruise 2: "+Re_c2);

%Loiter
rho_l = 1.058; %density of air at loiter: 5000ft (kg/m3)
u_l = 120.756464717203; % Loiter speed, obtained from the constraint diagram code (m/s-1)
dv_l = 0.00001747; %Dynamic viscosity of air at loiter (kg/m/s)
Re_l = (rho_l*u_l*MAC)/dv_l;
disp("Reynolds number for loiter: "+Re_l);

%--------------------------------------------------------------------------
%Finding the Cl_max for each mission segment
C_D0 = 0.0172; %Estimated from the L/Dmax estimated
AR = 10; %Arbituary aspect ratio
w_s = 7550;% Wing loading at take off chosen from the constraint diagram
rho_cl1 =1.225; % density of air at sea level (kg/m3)

%Cruise 1 (start)
q_c1 = 1/2*(u_c1)^2*rho_c1; %dynamic pressure for cruise 1 (N/m2)
w_s_c1 = w_s*0.970*0.985; %Wing loading for cruise1 (start cruise)
Cl_max_c1_1 = (1/q_c1)*w_s_c1;

%Cruise 1 (mid)
w_s_c1 = w_s*0.970*0.985*0.8041; %Wing loading for cruise1 (mid cruise)
Cl_max_c1_2 = (1/q_c1)*w_s_c1;

%Cruise 1 (end)
w_s_c1 = w_s*0.970*0.985*0.6466; %Wing loading for cruise1 (end cruise)
Cl_max_c1_3 = (1/q_c1)*w_s_c1;

%Cruise 2 (start)
q_c2 = 1/2*(u_c2)^2*rho_c2; %dynamic pressure for cruise 2 (N/m2)
w_s_c2 = w_s*0.970*0.985*0.6466*0.990*0.985;
Cl_max_c2_1 = (1/q_c2)*w_s_c2;

%Cruise 2 (mid)
w_s_c2 = w_s*0.970*0.985*0.6466*0.990*0.985*0.9946;
Cl_max_c2_2 = (1/q_c2)*w_s_c2;

%Cruise 2 (end)
w_s_c2 = w_s*0.970*0.985*0.6466*0.990*0.985*0.9893;
Cl_max_c2_3 = (1/q_c2)*w_s_c2;

%Loiter (start)
q_l = 1/2*(u_l)^2*rho_l; %dynamic pressure for cruise 2 (N/m2)
w_s_l = w_s*0.970*0.985*0.6466*0.990*0.985*0.9893;
Cl_max_l_1 = (1/q_l)*w_s_l;

%Loiter (end)
w_s_l = w_s*0.970*0.985*0.6466*0.990*0.985*0.9893*0.9850;
Cl_max_l_2 = (1/q_l)*w_s_l;

disp("Cl_max for start, mid and end of cruise 1 :"+ Cl_max_c1_1 +", "+Cl_max_c1_2+", "+Cl_max_c1_3)
disp("Cl_max for start, mid and end of cruise 2 :"+ Cl_max_c2_1 +", "+Cl_max_c2_2+", "+Cl_max_c2_3)
disp("Cl_max for start and end of loiter :"+Cl_max_l_1+", "+Cl_max_l_2)
% As Cruise 1 is the major section of the mission, the aerofoil will be
% selected with the majority consideration from these CL_max, but
% consideration fo the cl max from cruise 2 and the loiter segment should
% also be given








