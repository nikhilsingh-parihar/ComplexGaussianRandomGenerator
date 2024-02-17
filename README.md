# How to generate complex gaussian variable, vector, matrix: A generalized code with desired covariance matirx
This code serves as an explanation of how to generate Gaussian random variables, vectors, or matrices. If you are new to MATLAB and wish to understand the complete explanation with the mathematics involved, you can refer to `EXPLANATION.md` in the same repository. In this code, we will generate x and verify whether it possesses the same variance or covariance matrix as the desired covariance matrix.The following provides a generalized approach for generating complex Gaussian x, where cov_mat_desired represents the desired variance or covariance. The structure of the cov_mat_desired is as follows:
$$
CovMat = \begin{bmatrix}
    \sigma^2 & \ldots & {\rho} \\
    \vdots & \ddots & \vdots \\
    \rho & \ldots & \sigma^2
\end{bmatrix}
$$
$\rho$ represents the correlation coefficients, and $\sigma^2$ denotes the variance, which leads to the generation of the covariance matrix in the code. In certain scenarios, the covariance matrix might not have identical diagonal elements, which correspond to the variances. Ultimately, the simulated and desired covariance matrices are approximately similar.