function[ApproxValue] = CompositeTrap(f, n, a, b)
stepSize = (b-a)/n;
currentStep = a;
funcEvalSum = 0;

%Calculates the (f(x_0) + 2*f(x_1) + ... + f(xn)) term
while currentStep < b %Less than so the last f(x_n) is not multiplied by 2
    %Calculates f(x_n)
    funcEvalSum = funcEvalSum + f(currentStep);
    currentStep = currentStep + stepSize;
    %Calculates f(x_n+1)
    funcEvalSum = funcEvalSum + f(currentStep);
end

%Gives Approximate value
ApproxValue = funcEvalSum * (stepSize / 2);
end