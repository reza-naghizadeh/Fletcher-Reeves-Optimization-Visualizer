# Fletcher-Reeves Optimization Visualizer

This repository contains a MATLAB implementation of the **Fletcher-Reeves Conjugate Gradient Method** for optimizing a quadratic function. The script visualizes the optimization process using a contour plot, showing the path to convergence at the function's minimum point.

This code was developed as part of our Optimization course project at IASBS, in collaboration with my groupmate, [Erfan Faridi](https://github.com/erfanfaridii/).

## Features

- **Contour Plot Visualization**: Displays the function's contour plot and tracks the optimization steps.
- **Fletcher-Reeves Update**: Implements the Fletcher-Reeves formula for updating the conjugate gradient direction.
- **Dynamic Learning Rate**: Recalculates the learning rate at each iteration to ensure optimal convergence.
- **Convergence Check**: Iterates until the solution meets a specified tolerance.
- **Detailed Results**: Outputs the number of iterations, the minimum point, and the function value at convergence.

## Prerequisites

- MATLAB R2016b or later.
- Symbolic Math Toolbox.

## Getting Started

### Clone the Repository
```bash
git clone https://github.com/username/Fletcher-Reeves-Optimization-Visualizer.git
cd Fletcher-Reeves-Optimization-Visualizer
```

### Run the Script

1. Open `fletcher_reeves_visualizer.m` in MATLAB.
2. Run the script.

### Output

- The script will display:
  - The number of iterations to convergence.
  - The coordinates of the minimum point.
  - The minimum value of the function.
- A contour plot with the optimization path overlaid.

## Customization

- **Initial Point**: Modify the initial point `x`:
  ```matlab
  x = [-2; 2.5];
  ```

- **Tolerance**: Adjust the stopping criteria:
  ```matlab
  if (errorAmountx1 < 10e-8 && errorAmountx2 < 10e-8)
  ```

- **Function**: Replace the function `f` with your desired quadratic function:
  ```matlab
  f(x1, x2) = (10 * x1 ^ 2) - (4 * x1 * x2) + (x2 ^ 2);
  ```

## Example Output

The script minimizes the function:

\[ f(x_1, x_2) = 10x_1^2 - 4x_1x_2 + x_2^2 \]

and outputs the minimum point, function value at the minimum, and visualizes the optimization path.

## Acknowledgments

- MATLAB Documentation: [Symbolic Math Toolbox](https://www.mathworks.com/products/symbolic.html)
- Fletcher-Reeves Method: [Wikipedia](https://en.wikipedia.org/wiki/Conjugate_gradient_method)

