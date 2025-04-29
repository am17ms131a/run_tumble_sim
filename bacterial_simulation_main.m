clear; clc; close all;

%parameter
params.N=100;%no. of bacteria
params.L=100;%length of box
params.v_mean=10;%mean run speedp
params.v_sigma=2;% speed fluctuation
params.lambda_t=0.1;%tumble rate
params.lambda_r=0.2;%run rate
params.dt=0.1;%Time step
params.T=200;%Total simulation time
params.steps=params.T/params.dt;%no of steps
params.Dr=2.5;%rotation diffusivity
params.D=0.2;%Thermal difusion
params.sigma=1;% partical radius

%initialise bacteria
bacteria = initialise_bacteria(params);

