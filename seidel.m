h = 0.01;
n = 100;

xi = zeros(n,1);
razlike = zeros(n,1) * -Inf;
k = 1;
pogoj = Inf;

% poračunamo prvi stolpec xi:
for i=1:n
    xi(i,1)=i*h;
end

while pogoj>=10^-3
    for i=1:n
        if i == 1
            ui = (i*h)^2 +exp(-xi(i,k));
        else 
            ui = xi(i-1,k+1) +(i*h)^2 +exp(-xi(i,k)); %izračunamo nov xi, ki je približek za ui
            % upostevamo, da smo ze izracunali xi(i-1,k+1)
        end
        xi(i,k+1) = ui;
        razlike(i,k)= abs(xi(i,k)-xi(i,k+1));
    end
    pogoj = max(razlike(:,k));
    k = k+1;
end
xi(n,k)

% tocke za risanje
X = zeros(1,n);
Y = zeros(1,n);

for i=1:100
    X(i)=xi(i,1);
    Y(i)=xi(i,k);
end

clf
hold on
plot(X, Y);
hold off
