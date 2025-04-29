function bacteria = handle_collisions(bacteria, params)
    N = params.N;
    sigma = params.sigma;

    for i = 1:N
        for j = i+1:N
            dx = bacteria.x(i) - bacteria.x(j);
            dy = bacteria.y(i) - bacteria.y(j);
            dist = sqrt(dx^2 + dy^2);
            if dist < 2 * sigma
                % Elastic collision
                v1 = [bacteria.vx(i), bacteria.vy(i)];
                v2 = [bacteria.vx(j), bacteria.vy(j)];
                normal = [dx, dy] / dist;
                tangent = [-normal(2), normal(1)];

                v1n = dot(v1, normal) * normal;
                v1t = dot(v1, tangent) * tangent;
                v2n = dot(v2, normal) * normal;
                v2t = dot(v2, tangent) * tangent;

                % Swap normal components
                bacteria.vx(i) = v2n(1) + v1t(1);
                bacteria.vy(i) = v2n(2) + v1t(2);
                bacteria.vx(j) = v1n(1) + v2t(1);
                bacteria.vy(j) = v1n(2) + v2t(2);
            end
        end
    end
end
