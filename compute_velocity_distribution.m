function compute_velocity_distribution(bacteria, params)
    % Compute and plot velocity distribution at the end of simulation
    velocities_magnitude = sqrt(bacteria.vx.^2 + bacteria.vy.^2);
    
    figure;
    histogram(velocities_magnitude, 20, 'Normalization', 'pdf');
    xlabel('Speed');
    ylabel('Probability Density');
    title('Velocity Distribution of Bacteria');
    
    % Optional: Fit with Gaussian
    hold on;
    mu = mean(velocities_magnitude);
    sigma = std(velocities_magnitude);
    v_range = linspace(min(velocities_magnitude), max(velocities_magnitude), 100);
    pdf_fit = (1/(sigma*sqrt(2*pi))) * exp(-(v_range - mu).^2 / (2*sigma^2));
    plot(v_range, pdf_fit, 'r-', 'LineWidth', 2);
    legend('Simulated', 'Gaussian Fit');
    
    % Save if needed
    savefig('velocity_distribution.fig');
end