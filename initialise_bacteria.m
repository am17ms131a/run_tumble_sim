function bacteria = initialise_bacteria(params)
    N = params.N;
    L = params.L;
    v_mean = params.v_mean;
    v_sigma = params.v_sigma;

    bacteria.x = rand(N,1) * 0.1 * L;
    bacteria.y = rand(N,1) * L;
    bacteria.theta = rand(N,1) * 2 * pi;
    bacteria.state = [ones(N/2,1); zeros(N/2,1)]; % 50% run, 50% tumble
    bacteria.velocities = (v_sigma * randn(N,1) + v_mean) .* bacteria.state;
    bacteria.vx = bacteria.velocities .* cos(bacteria.theta);
    bacteria.vy = bacteria.velocities .* sin(bacteria.theta);
end
