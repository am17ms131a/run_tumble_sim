function visualise_simulation(bacteria, running_fraction, tumbling_fraction, t, params)
    clf;
    subplot(1,2,1); hold on;
    scatter(bacteria.x(bacteria.state == 1), bacteria.y(bacteria.state == 1), 50, 'b', 'filled'); % Running
    scatter(bacteria.x(bacteria.state == 0), bacteria.y(bacteria.state == 0), 50, 'r', 'filled'); % Tumbling
    xlim([0 params.L]); ylim([0 params.L]);
    title(['Time: ', num2str(t * params.dt)]);
    
    subplot(1,2,2); hold on;
    plot((1:t)*params.dt, running_fraction(1:t), 'b', 'LineWidth', 2);
    plot((1:t)*params.dt, tumbling_fraction(1:t), 'r', 'LineWidth', 2);
    xlabel('Time'); ylabel('Fraction');
    legend('Running', 'Tumbling');
    title('Run-Tumble Fractions');
    xlim([0 params.T]); ylim([0 1]);
    drawnow;
end
