function table_assignments = chinese_restaurant_process(num_customers, alpha)
%% Chinese Restaurant Process Simulation
% INPUT:
%    num_customers : Number of customers comming in the restraunt
%    alpha         : Dispersion Parameter for Chinese Restaurant Process 
% OUTPUT:
%   table_assignments: assignment of tables to all num_customers customers

%%
if num_customers>0
    table_assignments = zeros(num_customers,1);
    % first customer sits at table 1
    table_assignments(1) = 1; 
    next_open_table = 2;
    for i=2:num_customers
        % (i-1) customers already sitting
        if rand([1,1]) < (alpha/(alpha + i-1))
            % Customer sits at new table.
            % probability to sit at a new table = alpha/(i-1 + alpha)
            table_assignments(i) = next_open_table;
            next_open_table = next_open_table + 1;
        else
            % Customer sits at an existing table and chooses 
            % a table to sit at by giving equal weight to each
            % customer already sitting at a table. 
            % probability to sit at kth table = nk/(i-1 + alpha)
            % randi([imin,imax],[m,n])
            which_table = table_assignments(randi([1,i-1],[1,1]));
            table_assignments(i) = which_table;
        end
        %table_assignments
    end
else
    table_assignments = [];
% TODO
%     can also generate parameters for each partition/table from a base distribution 
%     G0 (for example, each table could represent a Gaussian whose mean and standard 
%     deviation are sampled from G0), though this is not part of the CRP.
end