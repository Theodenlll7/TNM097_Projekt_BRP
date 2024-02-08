% Load the image
img = imread("Bilder\steam.jpg");
img = im2double(img);

% Determine bead/board size
prompt = 'Enter the diameter of each bead (in pixels): ';
pearlPixelSize = input(prompt);

% Initialize variables
pearlBoard = zeros(imgHeight, imgWidth, 3);
indexMatrix = zeros(totalRepBoardSide, totalRepBoardSide);

% Generate a uniformly distributed set of colors in the CIElab space
lab_min = [0, -128, -128]; % Minimum values for L, a, and b
lab_max = [100, 128, 128]; % Maximum values for L, a, and b
num_colors = 100000; % Number of colors to generate

% Create a uniformly distributed set of colors in the CIElab space
lab_colors = bsxfun(@plus, bsxfun(@times, rand(num_colors, 3), lab_max - lab_min), lab_min);

% Use k-means clustering to select 100 bead colors that best represent these colors
numBeadColors = 100;
[idx, beadColors] = kmeans(double(lab_colors), numBeadColors);

% Loop through the image in pearlPixelSize steps
for j = 1:pearlPixelSize:imgHeight - pearlPixelSize + 1
    for k = 1:pearlPixelSize:imgWidth - pearlPixelSize + 1
        % Select the subarray corresponding to this region
        subarray = img(j:j + pearlPixelSize - 1, k:k + pearlPixelSize - 1, :);

        % Determine the color of the bead for this subarray
        index = ClosesColor(subarray, beadColors);
        color = beadColors(index,:);

        % Generate the pearl subarray and add it to the pearlBoard
        [h_bead, w_bead, ~] = size(subarray);
        subarray_bead = repmat(color, [h_bead, w_bead, 3]);
        
        % Calculate the dimensions of the region to fill in pearlBoard
        start_h = j;
        start_w = k;
        end_h = min(start_h + h_bead - 1, imgHeight);
        end_w = min(start_w + w_bead - 1, imgWidth);
        
        % Assign the bead color to the corresponding region in pearlBoard
        pearlBoard(start_h:end_h, start_w:end_w, :) = subarray_bead(1:end_h-start_h+1, 1:end_w-start_w+1, :);

        % Ensure index is scalar before assigning to indexMatrix
        indexMatrix(ceil(j / pearlPixelSize), ceil(k / pearlPixelSize)) = index(1);
    end
end

% Display the generated pearl board
imshow(pearlBoard);
imwrite(pearlBoard, 'myimage.png');

% Define color matching function
function index = ClosesColor(subarray, colors)
    % Calculate the average color of the subarray
    subarray = rgb2lab(subarray);
    avgColor = mean(mean(subarray, 1), 2);
    
    % Calculate the Euclidean distance between the average color and each color in the palette
    distances = sqrt(sum((colors - avgColor).^2, 2));
    
    % Find the index of the closest color
    [~, index] = min(distances);
end
