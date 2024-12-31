% p15.m - solve eigenvalue BVP u_xx = lambda*u, u(-1)=u(1)=0
N = 36; [D,x] = cheb(N); D2 = D^2; D2 = D2(2:N,2:N);
[V,Lam] = eig(D2); lam = diag(Lam);
[foo,ii] = sort(-lam); % sort eigenvalues and -vectors
lam = lam(ii); V = V(:,ii); clf
for j = 5:5:30 % plot 6 eigenvectors
u = [0;V(:,j);0]; subplot(7,1,j/5)
plot(x,u,'.','markersize',12), grid on
xx = -1:.01:1; uu = polyval(polyfit(x,u,N),xx);
line(xx,uu), axis off
text(-.4,.5,sprintf('eig %d =%20.13f*4/pi"2',j,lam(j)*4/pi^2))
text(.7,.5,sprintf('%4.1f ppw', 4*N/(pi*j)))
end

%

function [D,x] = cheb(N)
    if N==0, D=0; x=1; return, end
        x = cos(pi*(0:N)/N)';
        c = [2; ones(N-1,1); 2].*(-1).^(0:N)';
        X = repmat(x,1,N+1);
        dX = X-X';
        D = (c*(1./c)')./(dX+(eye(N+1)));
        D = D - diag(sum(D'));
end