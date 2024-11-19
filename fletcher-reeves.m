clear all;
clc;

% Define the equation
syms x1 x2;
f(x1, x2) = (10 * x1 ^ 2) - (4 * x1 * x2) + (x2 ^ 2);

% plot the contour plot
fcontour(f, 'Fill', 'on');
% To show the color bar next to the plot
colorbar
% For 3d plot //// I just coment it because it doesn't look good
% fsurf(f);
% To hold the plot so we can show the update of point on it
hold on

% Initial point
x = [-2; 2.5];

% Gradient function
gStar = gradient(f);

% Gradient in initial point
gi = double(subs(gStar(x(1, 1), x(2, 1)),{x1,x2},{x(1,1),x(2,1)}));
p = -gi;
% Compute the Q as hessian matrix of function
Q = double(subs(hessian(f),{x1,x2},{x(1,1),x(2,1)}));

% Compute the learingRate for first time
learningRate = (transpose(gi) * gi) / (transpose(p) * Q * p);

% Two empty list to save the points during the update
x1List = [x(1, 1)];
x2List = [x(2, 1)];

for i = 1:100
    % Update the point
    x = x + learningRate * p;

    % Save the points inside the empty list for further use
    x1List = [x1List x(1, 1)]; %#ok
    x2List = [x2List x(2, 1)]; %#ok

    % Compute the next gradient with new point
    gii = gi + learningRate * Q * p;

    % compute the Beta
    beta = (transpose(gii) * gii) / (transpose(gi) * gi);
    
    % Update the p value
    p = -gii + beta * p;

    % Replace the new gradient value as old value
    gi = gii;

    % Compute the learning rate with new point
    learningRate = (transpose(gi) * gi) / (transpose(p) * Q * p);

    % Break the iteration
    % Check if the points don't change more than 10e-4 and if so break
    errorAmountx1 = x1List(1, i)  - x(1, 1);
    errorAmountx2 = x2List(1, i)  - x(2, 1);
    if (errorAmountx1 < 10e-8 && errorAmountx2 < 10e-8)
        break
    end
end

% After finding the min point print out the results
disp('Iteration = ');
disp(i);
disp('The Min Point = ');
disp(x);
disp('Final x in equation : ')
fResult = double(subs(f(x(1,1), x(2,1)),{x1,x2},{x(1,1),x(2,1)}));
disp(fResult);
plot(x1List, x2List, 'r-*');