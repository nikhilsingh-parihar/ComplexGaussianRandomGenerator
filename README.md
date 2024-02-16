# How to generate complex gaussian random variable/vector/matrix with desired covariance matrix
Gaussian random variable is useful in many simulation that we do everyday. Though there exists many functions which generates gaussian random variable or vector or matrix, it can be a little tricky to generate complex gaussian random variable with them. In MATLAB, functions like `randn`, `normrnd` can generate gaussian random variable but specifically in the given codes we have used 'randn' for simplicity.
Lets first generate a real gaussian random variable
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
But, if we check the variance of the variable `x`, it will be approximately 2. Now this is happening since we are adding two gaussian random variable. If x and y are two gaussian random variable with mean ${\mu}_1$, ${\mu}_2$ and variance ${\sigma}^2_1$ and ${\sigma}^2_2$, respectively then $x+y$ will be distributed as $\mathcal{N}({\mu}_1+{\mu}_2, {\sigma}^2_1+{\sigma}^2_1)$