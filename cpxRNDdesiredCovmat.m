clear
clc
iter            = 100000;                       % no of iteration
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
    simu_cov_mat           = simu_cov_mat + x*x';
end
disp(cov_mat_desired);
disp(simu_cov_mat/(iter*n))