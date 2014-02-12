function [balls_in_urn, colors] = polya_urn_model(base_color_distribution, num_balls, alpha)
%% Polya Urn Process Simulation
% INPUT:
%    base_color_distribution: 
%    num_balls : Number of ball in the urn
%    alpha     : Dispersion Parameter 
% OUTPUT:
%   balls_in_urn: assignment of ball colors to num_balls balls
%
% USAGE: 
% unit_uniform = @() randn;
% unit_uniform = @() rand;
% polya_urn_model(@rand, num_balls, alpha)
% polya_urn_model(@randn, num_balls, alpha)

%%
if num_balls>0
    %balls_in_urn = zeros(num_balls,1);
    num_color = 0;
    colors = [];
    for i=1:num_balls
        indicator = -1;
        % (i-1) balls in urn
        if rand([1,1]) < (alpha/(alpha + i-1))
            % Draw a new color, put a ball of this color in the urn.
            % probability to draw a new color = alpha/(i-1 + alpha)
            new_color = base_color_distribution();
            num_color = num_color + 1;
            balls_in_urn{i} = new_color';
            colors{num_color} = new_color';
            %indicator = 'new_color';
        else
            % Draw a ball from the urn, add another ball of the same color.
            % randi([imin,imax],[m,n])
            %randi([1,i-1],[1,1])
            sample_ball = randi([1,i-1],[1,1]);
            ball = balls_in_urn(sample_ball);
            balls_in_urn(i) = ball;
            %indicator = 'sample_color';
        end
    end
    balls_in_urn = cell2mat(balls_in_urn); 
    colors = cell2mat(colors);
    
else
    balls_in_urn = [];
end