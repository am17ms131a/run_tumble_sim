clear; clc; close all;

% Parameters
params.N = 100; % Number of bacteria
params.L = 100; % Box size
params.v_mean = 10; % Mean run speed
params.v_sigma = 2; % Speed fluctuation
params.lambda_t = 0.1; % Tumble rate
params.lambda_r = 0.2; % Run rate
params.dt = 0.1; % Time step
params.T = 200; % Total simulation time
params.steps = params.T / params.dt; % Number of steps
params.Dr = 2.5; % Rotational diffusion
params.D = 0.2; % Thermal diffusion
params.sigma = 1; % Particle radius

% Initialize bacteria
bacteria = initialise_bacteria(params);

% Storage
positions = zeros(params.N, 2, params.steps);
states = zeros(params.N, params.steps);
running_fraction = zeros(params.steps, 1);
tumbling_fraction = zeros(params.steps, 1);

% Simulation Loop
figure;
for t = 1:params.steps
    % Store data
    positions(:,:,t) = [bacteria.x, bacteria.y];
    states(:,t) = bacteria.state;
    running_fraction(t) = sum(bacteria.state) / params.N;
    tumbling_fraction(t) = 1 - running_fraction(t);
    
    % Update positions and states
    bacteria = update_positions(bacteria, params);
    
    % Handle collisions
    bacteria = handle_collisions(bacteria, params);
    
    % Visualization
    visualise_simulation(bacteria, running_fraction, tumbling_fraction, t, params);
end

% Save data
save('bacteria_simulation.mat', 'positions', 'states', 'running_fraction', 'tumbling_fraction');

% Compute and plot velocity distribution
compute_velocity_distribution(bacteria, params);

% Compute and plot Cvv
compute_cvv(positions, params);
