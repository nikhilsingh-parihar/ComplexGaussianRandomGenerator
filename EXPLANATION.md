# How to generate complex gaussian random variable/vector/matrix with desired covariance matrix
The Gaussian random variable is valuable in everyday simulations. While many functions can generate Gaussian random variables, including vectors or matrices, creating complex Gaussian random variables can be a little tricky. In MATLAB, functions like `randn` and `normrnd` can generate Gaussian random variables, but for simplicity, `randn` is used in the provided code.
Let's start by generating a real Gaussian random variable.
``` matlab
    x = randn;
``` 
Here, the function `randn` will generate number from standard normal distribution i.e., $\mathcal{N}(0,1)$. The mean and variance of the variable `x` can be checked by the following
```matlab
    iter        = 100000;           % no. of iterations
    x           = zeros(1,iter);    % initialising variable
    for j       = 1:iter
        x(j)    = randn;
    end
    disp(mean(x))                   % display mean
    disp(var(x))                    % display variance
```
But the problem in the above code is the variance. The variance of the variable `x` will be 1 but it can be changed simply by multipling the variable by a constant. If we could just go back and recall that will we muliply a gaussian random variable with a constant its mean and variance changes. Therefore, if $x \sim \mathcal{N}(\mu,\sigma^2)$, then $ax \sim \mathcal{N}(a\mu,a^2\sigma^2)$ and since `randn` is standard normal we can just multiply the variable by square root of variance ($\sqrt{\sigma^2}$)
Now if we made that change in our previous code then,
``` matlab
    varN        = 5;                % desired variance
    iter        = 100000;           % no. of iterations
    x           = zeros(1,iter);    % initialising variable
    for j       = 1:iter
        x(j)    = randn*sqrt(varN);
    end
    disp(mean(x))                   % display mean
    disp(var(x))                    % display variance
```
Now moving on to the complex random variables. There is no separate function in matlab to generate complex random variable, so we just add real and imaginary random variable to generate, i.e., `randn + 1i*randn`. So in order to generate complex gaussian random variable we simply use,
```matlab
    x    = randn + 1i*randn;
```
But, if we check the variance of the variable `x`, it will be approximately 2. Now this is happening since we are adding two gaussian random variable. If x and y are two gaussian random variable with mean ${\mu}_1$, ${\mu}_2$ and variance ${\sigma}^2_1$ and ${\sigma}^2_2$, respectively then $x+y$ will be distributed as $\mathcal{N}({\mu}_1+{\mu}_2, {\sigma}^2_1+{\sigma}^2_1)$. To overcome this issue we can simply multiply the variable by $\sqrt(\sigma^2/2)$. Therefore, the code will be,
``` matlab
    iter        = 100000;
    x           = zeros(1,iter);
    varN        = 1;
    for j       = 1:iter
        x(j)    = (randn + 1i*randn)*sqrt(varN/2);
    end
    disp(mean(x))
    disp(var(x))
```
While moving our discussion to complex gaussian vector/matrix we come across covariance matrix. But the logic remains the same for generating the vector/matrix with desired covariance matrix. Specifying the size of the vector/matrix in `randn` will help. So, in order to generate the vector or matrix we just had to multiply it with the sqrt of desired covariance matrix. So, the following MATLAB code is a generalized code for generating any variable or vector or matrix.
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
