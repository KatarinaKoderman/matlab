h = 0.01;
n = 100;

xi = zeros(n,1);
razlike = NaN(n,1);

k = 1;
pogoj = Inf;

% poracunamo prvi stolpec xi:
for i=1:n
    xi(i,1)=i*h;
end

while pogoj>=10^-3
    for i=1:n
        if i==1
            delta = (xi(i,k)-(i*h)^2-exp(-xi(i,k)))/(1+exp(-xi(i,k)));
        else
            delta = (xi(i,k)-xi(i-1,k+1)-(i*h)^2-exp(-xi(i,k)))/(1+exp(-xi(i,k)));
        end        
        xi(i,k+1) = xi(i,k)-delta;
        razlike(i,k)= abs(xi(i,k)-xi(i,k+1));
    end
    pogoj = max(razlike(:,k));
    k = k+1;
end
xi(n,k)