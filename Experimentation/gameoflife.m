clear;
clc;

height = 101;
width = 101;
currentGrid = randi([0 1], height, width); %0 = alive, 1=dead


for itt = 1:1000
    drawGrid(currentGrid);
    currentGrid = runGameCound(currentGrid);
    pause(0.1);
end

function newGrid = runGameCound(currentGrid)
    [h, w] = size(currentGrid);
    newGrid = zeros(h,w);
    for i = 1:w
        for j = 1:h
            newGrid(i,j) = getCellNextState(i, j, currentGrid);
        end
    end
end

function ign = drawGrid(mat)
    ign = 0;
    [r, c] = size(mat);                               % Get the matrix size
    imagesc((1:c)+0.5, (1:r)+0.5, mat);               % Plot the image
    colormap(gray);                                   % Use a gray colormap
    axis equal                                        % Make axes grid sizes equal
    set(gca, 'XTick', 1:(c+1), 'YTick', 1:(r+1), ...  % Change some axes properties
         'XLim', [1 c+1], 'YLim', [1 r+1], ...
         'GridLineStyle', '-', 'XGrid', 'on', 'YGrid', 'on');
end

function neigbohurCount = getCellNeighbours(x, y, vgrid)
    [height, width] = size(vgrid);
    neigbohurCount = 0;
    n = [[x-1 y-1]; [x y-1]; [x+1 y-1]; [x-1 y]; [x+1 y]; [x-1 y+1]; [x y+1]; [x+1 y+1]];
    for i = 1:length(n)
            %Test outside bounds
            if (n(i,1) < 1 || n(i,2) < 1 || n(i,2) > height || n(i,1) > width)
               continue;
            elseif (vgrid(n(i,1), n(i,2)) == 0)
                neigbohurCount = neigbohurCount + 1;
            end
    end
end

function nextCellState = getCellNextState(x, y, vgrid)
    currentN = getCellNeighbours(x, y, vgrid);
    currentC = vgrid(x, y);
    
    if (currentC == 0)
        if (currentN >= 2 && currentN <= 3)
            nextCellState = 0;
        else
            nextCellState = 1;
        end
    else
        if (currentN == 3)
            nextCellState = 0;
        else
            nextCellState = 1;
        end
    end
end