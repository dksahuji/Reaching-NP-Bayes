function demo_polya_urn()
    x = -5:0.1:5;
    y = zeros(size(x));
    num_balls = 1000;
    [urn, colors] =  polya_urn_model(@randn, num_balls, 1);
    hist_colors = histc(urn,sort(colors));
    hist_colors = hist_colors / sum(hist_colors);
    for i=1:length(urn)
        y=y + gaussmf(x,[0.3 urn(i)]);
    end
    y = (y/sum(y));
    figure;
    % distribution plot
    plot(x,y);
    hold on;
    % Histogram plot
    stem(sort(colors),(hist_colors));
end