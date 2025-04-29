function compute_cvv(positions, params)
    % Compute velocity autocorrelation function (Cvv)
    N = params.N;
    dt = params.dt;
    steps = params.steps;
    
    % Calculate velocities from positions
    vx_all = diff(positions(:,1,:),1,3) / dt;
    vy_all = diff(positions(:,2,:),1,3) / dt;
    
    % Average over all bacteria
    vx_all = squeeze(vx_all);
    vy_all = squeeze(vy_all);
    
    % Now compute Cvv(tau)
    max_lag = steps - 2; % Max lag time
    cvv = zeros(max_lag,1);
    
    for lag = 1:max_lag
        dot_product_sum = 0;
        count = 0;
        for t = 1:(size(vx_all,2)-lag)
            v1 = [vx_all(:,t), vy_all(:,t)];
            v2 = [vx_all(:,t+lag), vy_all(:,t+lag)];
            dot_product_sum = dot_product_sum + sum(dot(v1,v2,2)); % sum over all bacteria
            count = count + N;
        end
        cvv(lag) = dot_product_sum / count;
    end
    
    % Normalize Cvv
    cvv = cvv / cvv(1);
    
    % Time array
    tau = (1:max_lag)' * dt;
    
    % Plot
    figure;
    plot(tau, cvv, 'LineWidth', 2);
    xlabel('\tau');
    ylabel('C_{vv}(\tau)');
    title('Velocity Autocorrelation Function');
    xlim([0 max(tau)]);
    
    % Save
    savefig('cvv_plot.fig');
end
