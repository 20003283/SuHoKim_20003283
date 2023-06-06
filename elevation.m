function el = elevation(ENU, el_mask)

% input : ENU (행이 시각 또는 위성수, 열이 ENU로 구성된 위성 ENU 위치로 구성된 n-by-3 matrix, 단위 km), el_mask (위성 최소 앙각, deg)
% output : elevation angle (1-by-n, 단위 deg)

ENU = [1 1 2; 1 1 2; -2 2 3; 1 -1 2]; % 예시 값
el_mask=15;

    n = size(ENU, 1); 
    el = zeros(1, n);
    
    for i = 1:n
        east = ENU(i, 1); 
        north = ENU(i, 2); 
        up = ENU(i, 3); 
        
        el(i) = atan2(up, sqrt(east^2 + north^2)) * 180/pi; %deg
        
        if el(i) < el_mask
            el(i) = NaN;
        end
    end
end