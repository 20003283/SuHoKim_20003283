function az = azimuth(ENU)

% input : ENU (행이 시각 또는 위성수, 열이 ENU로 구성된 위성 ENU 위치로 구성된 n-by-3 matrix, 단위 km)
% output : azimuth angle (1-by-n, 단위 deg)

ENU = [1 0 1; 1 1 0; -1 1 0; 1 -1 0]; % 예시 값

    n = size(ENU, 1);
    az = zeros(1, n); 
    
    for i = 1:n
        east = ENU(i, 1);
        north = ENU(i, 2);
        
        az(i) = mod(atan2(east, north), 2*pi) * 180/pi; % 값deg
        

        if az(i) < 0
            az(i) = az(i) + 360;
        end
    end
end
