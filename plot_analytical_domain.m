function plot_analytical_domain(appr_order, R_0)
    if appr_order < 1 || ~isstruct(R_0)
        warning('plot_analytical_domain: bad inputs'); return;
    end
    ord0   = floor(appr_order/2);
    ordVec = ord0:appr_order;
    cmap = flipud(gray(max(numel(ordVec),2)));
    holdState = ishold; hold on;

    last_roots = [];
    run_idx = 1;
    for order = ordVec
        p = zeros(1, order+1);
        for j = 1:order
            if j <= numel(R_0) && isfield(R_0(j),'coeffs') && ~isempty(R_0(j).coeffs)
                crow = R_0(j).coeffs(1,:);
                nz   = crow(abs(crow) > 0);
                if ~isempty(nz), p(j+1) = real(nz(1)); end
            end
        end
        rts = roots(flip(p));
        last_roots = rts;
        if order < appr_order
            plot(real(rts), imag(rts), '.', ...
                 'Color', cmap(min(run_idx,size(cmap,1)),:), ...
                 'MarkerSize', 10, 'HandleVisibility','off');
        else
            plot(real(rts), imag(rts), 'm.', 'MarkerSize', 10, ...
                 'LineWidth', 2, 'DisplayName', 'Roots of $a(\rho)$', ...
                 'Color', 'm');
        end
        run_idx = run_idx + 1;
    end
    xlabel('Real part', 'Interpreter','latex');
    ylabel('Imaginary part', 'Interpreter','latex');
    legend('show', 'Interpreter','latex', 'Location','best');
    axis equal; box off;

    if ~isempty(last_roots)
        rho_med = median(abs(last_roots));
        sel     = abs(last_roots) > rho_med;
        if any(sel)
            rho = mean(abs(last_roots(sel)));
            if isfinite(rho) && rho > 0
                lim = 1.5 * rho;
                xlim([-lim, lim]); ylim([-lim, lim]);
            end
        end
    end
    if ~holdState, hold off; end
end
