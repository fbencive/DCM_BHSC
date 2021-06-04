for i = 1:height(DCM.M.pC.A)
    for k = 1:width(DCM.M.pC.A)
        if DCM.M.pE.A(i,k,1)~=0.0078
        DCM.M.pC.A(i,k,1)=0;
        end
    end
end