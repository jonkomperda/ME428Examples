% Set these equal to something
a = 1;
b = 0;
c = -1;
d = 1;
e = 0;
L = 1;

n = 101; % # of solution points (note, you need ~50+ to get good answer)

dx = L/(n-1); % calculate \Delta x
x = 0:dx:L; % make our x-array for space

% build our Ax=B matrix
A = zeros(n,n+1); % this is a concatenated matrix with the right hand side included
A(1,1)   = 1; % this is our top boundary condition
A(1,n+1) = d; 
for i=2:n-1 % this is our interior finite difference coefficients
   A(i,i-1) = a-b*dx/2;
   A(i,i)   = -2*a+c*dx*dx;
   A(i,i+1) = a+b*dx/2;
end
% our bottom boundary condition
A(n,n-2) = 3/2;
A(n,n-1) = -2;
A(n,n)   = 1/2;
A(n,n+1) = e;

% now we solve our system using our method of choice. I'm lazy so I use
% rref instead of programming one. Refer to earlier chapters for how to
% solve systems of ODEs
sol = rref(A);
u = sol(:,n+1)'; % we only care about the right hand side, so we copy it

plot(x,u)