function F = disccosxform(f)
    % Assume square input
    N = length(f);
    n = repmat(1 : N, N, 1);
    C = sqrt(2/N) * cos((pi .* (2 * n - 1) .* (n' - 1)) ./ (2 * N));
    C(1,:) = 1/sqrt(N) * ones(1,N);
    F = C * f * C';
end