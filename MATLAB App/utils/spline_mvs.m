% interp1_mvs(Ain, Nout)
function Aout = spline_mvs(Ain, Nout)
    if sum(isnan(Ain))
        Aout  = nan(1,Nout)';
    else
        Aout  = spline( linspace(0,1,length(Ain)),  Ain(:),  linspace(0,1,Nout) );
    end
    
    