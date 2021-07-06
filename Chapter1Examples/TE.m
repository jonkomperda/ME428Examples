%% Demonstration of truncation error
dx = 0.0001;
x  = 0:dx:0.7;

f1 = 1 + x; % two term solution
f2 = 1 + x + x.^2; % three term solution
f3 = 1 + x + x.^2 + x.^3; % four term solution
f4 = 1 + x + x.^2 + x.^3 + x.^4; % five term solution
exact = 1./(1-x); % exact function solution

%% Creation of figures
% Create figure
figure1 = figure;
% Create axes
axes1 = axes('Parent',figure1,'FontSize',20);
xlim(axes1,[0 0.7]);
ylim(axes1,[0 4]); % you may need to change these limits for plotting different functions
box(axes1,'on');
hold(axes1,'on');
% Create loglog
plot(x,f1,'LineWidth',2,'Color','r'); % plot of the two term series expansion
hold on;
plot(x,f2,'LineWidth',2,'Color',[.1 .9 .1]); % plot of the three term series expansion
plot(x,f3,'LineWidth',2,'Color','b'); % plot of the four term series expansion
plot(x,f4,'LineWidth',2,'Color','cy'); % plot of the five term series expansion
plot(x,exact,'--','LineWidth',2,'Color','k'); % plot of the exact function

% The legend needs to be edited to for new functions if using for homework
legend('f(x)=1+x','f(x)=1+x+x^2','f(x)=1+x+x^2+x^3','f(x)=1-x+x^2+x^3+x^4','Exact','Location','best')

%save the figure for powerpoint or submitting your homework
print('TE_example','-dpng','-r600')

%Calculate the errors at a point. these need to be shown in homework
%solution, either by pasting in a word document or screenshot of the matlab
%output.
x=0.5
te1 = 1+x % two term solution
te2 = 1+x+x^2 % three term solution
te3 = 1+x+x^2+x^3 % four term solution
te4 = 1+x+x^2+x^3+x^4 % five term solution
exact = 1/(1-x) % the exact answer
err1 = abs(te1-exact) % absolute error attributed to two terms
err2 = abs(te2-exact) % error attributed to three terms
err3 = abs(te3-exact) % error attributed to four terms
err4 = abs(te4-exact) % error attributed to five terms