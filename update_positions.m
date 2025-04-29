function bacteria=update_positions(bacteria,params)
    dt=params.dt;
    Dr=params.Dr;
    D=params.D;
    lambda_t=params.lambda_t;
    lambda_r=params.lambda_r;
    N=params.N;
    L=params.L;

    for i =1:N
        if bacteria.state==1
            bacteria.x(i)=bacteria.x(i)+bacteria.vx(i)*dt;
            bacteria.y(i)=bacteria.y(i)+bacteria.vy(i)*dt;
            if rand<lambda_t*dt
                bacteria.state(i)=0;
                bacteria.theta(i)=bacteria.theta(i)+sqrt(4*Dr*dt)*randn;
            end
        else%tumbling
            if rand<lambda_r*dt
                bacteria.state(i)=1;
                bacteria.velocities(i)=params.sigma*randn+params.v_mean;
                bacteria.theta(i)=bacteria.theta(i)+sqrt(4*Dr*dt)*randn;
                bacteria.vx(i)=bacteria.velocities(i)*cos(bacteria.theta(i));
                bacteria.vy(i)=bacteria.velocities(i)*sin(bacteria.theta(i));
            else
                bacteria.x(i)=bacteria.x(i)+sqrt(2*D*dt)*randn;
                bacteria.y(i)=bacteria.y(i)+sqrt(2*D*dt)*randn;
            end
        end
        bacteria.x(i)=mod(bacteria.x(i),L);
        bacteria.y(i)=mod(bacteria.y(i),L);
    end
end
