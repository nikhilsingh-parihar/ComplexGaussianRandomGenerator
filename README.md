# How to generate complex gaussian variable, vector, matrix: A generalized code with desired covariance matirx
The following code provides a generalized approach for generating complex Gaussian x, where cov_mat_desired represents the desired variance or covariance. The structure of the cov_mat_desired is as follows:
$$
CovMat = \begin{bmatrix}
    \sigma^2 & \ldots & {\rho} \\
    \vdots & \ddots & \vdots \\
    \rho & \ldots & \sigma^2
\end{bmatrix}
$$
$\rho$ represents the correlation coefficients, and $\sigma^2$ denotes the variance, which leads to the generation of the covariance matrix in the code. In certain scenarios, the covariance matrix might not have identical diagonal elements, which correspond to the variances. Ultimately, the simulated and desired covariance matrices are approximately similar.

``` matlab
   iter            = 100000;                        % no of iteration
    m               = 5;                            % no of rows
    n               = 10;                           % no of columns
    simu_cov_mat    = 0;                            % initialing simulated covariance matrix

    %% Generating desired covariance matrix (symmetric matrix with diagonal elements as the variance)
    varN            = 5;
    temp_mat        = rand(m,m);
    temp_mat        = (temp_mat + temp_mat.')/2;
    temp_mat        = real(sqrtm(temp_mat));
    temp_mat(1:m+1:end) = varN/2;
    cov_mat_desired = 2*(sqrtm(temp_mat) * sqrtm(temp_mat));
    sqrt_cov_mat    = sqrtm(cov_mat_desired/2);

    %% Generating Gaussian random x and displaying mean and variance
    for itr         = 1:iter
        x           = sqrt_cov_mat*(randn(m, n) + 1i*randn(m, n));
        simulated_cov_mat           = simulated_cov_mat + x*x';
    end
    disp(cov_mat_desired);
    disp(simulated_cov_mat/(iter*n))
``` 