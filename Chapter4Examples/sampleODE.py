import numpy as np
from matplotlib import pyplot as plt
# Set these equal to something
a = 1.0
b = 0.0
c = -1.0
d = 1.0
e = 0.0
L = 1.0

n = 101 # number of solution points (note, you need ~50+ to get a good answer)

dx = L/(n-1) # calculates \Delta x
x = np.linspace(0,L,n)

# build our Ax=B matrix
A = np.zeros((n,n+1))
A[0,0] = 1.0 # this is our top boundary condition
A[0,n] = d
for i in range(1,n):
    A[i,i-1] = a-b*dx/2.0
    A[i,i]   = -2.0*a+c*dx*dx
    A[i,i+1] = a+b*dx/2.0
#bottom boundary condition
A[n-1,n-3] = 3.0/2.0
A[n-1,n-2] = -2.0
A[n-1,n-1] = 1.0/2.0
A[n-1,n]   = e

# now we solve our system using our method of choice. I'm lazy so I use numpy
# instead of programming one. Refer to earlier chapters for how to solve systems
# of equations (using methods like Thomas Algorithm, Gaussian Elimination, etc.)

alpha = A[0:n,0:n]
beta  = A[0:n,n]
sol = np.linalg.solve(alpha,beta)

plt.plot(x,sol)
plt.show()