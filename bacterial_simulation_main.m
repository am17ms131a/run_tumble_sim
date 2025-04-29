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

%Storage
positions=zeros(params.N,2, params.steps);
states=zeros(params.N,params.steps);
running_fraction = zeros(params.steps,1);
tumbling_fraction = zeros(params.steps,1);

%Simulation loop
figure;
for t =1:params.steps
    positions(:,:,t)=[bacteria.x,bacteria.y];
    states(:,t)=bacteria.state;
    running_fraction(t)=sum(bacteria.state)/params.N;
    tumbling_fraction(t)=1-running_fraction(t);
end

%update bacteria position and states

bacteria=update_positions(bacteria, params);
