depletion=zeros(Ne_1d,1)
for i=1:Ne_1d-1
    if psi(i)~=psi(i+1)
        depletion(i,1)=1;
    else
        depletion(i,1)=0;
    end
end