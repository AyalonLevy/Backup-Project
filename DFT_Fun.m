function DFT_Sig = DFT_Fun(Sig)

i = sqrt(-1);
DFT_Sig = Sig;
N = length(Sig);

for k=1:N
    sum_n=0;
    for n=1:N
        sum_n=sum_n+Sig(n)*(exp((-2*pi*i)*(k-1)*(n-1)/N));
    end
    DFT_Sig(k)=sum_n;
end

DFT_Sig = 1/N*DFT_Sig;