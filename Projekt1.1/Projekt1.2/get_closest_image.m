function closest_image = get_closest_image(images, tile)
    % Calculate deltaE between each image in database and the tile
    num_images = numel(images);
    deltaE = zeros(num_images, 1);
    tile_size = size(tile, 1); % Assuming square tiles
    
    % Get the size of the tile
    [tile_rows, tile_cols, ~] = size(tile);
    
    % Calculate the starting row and column for cropping
    start_row = 1;
    start_col = 1;
    
    % Calculate the ending row and column for cropping
    end_row = size(tile, 1);
    end_col = size(tile, 2);
    
    for i = 1:num_images
        % Crop the image to match the size of the tile
        cropped_image = images{i}(start_row:end_row, start_col:end_col, :);
        
        % Calculate deltaE between cropped image and the tile
        deltaE(i) = sqrt(sum((cropped_image(:) - tile(:)).^2));
    end
    
    % Find the index of the closest image
    [~, min_idx] = min(deltaE);
    
    % Retrieve and assign the closest image after cropping
    closest_image = images{min_idx}(start_row:end_row, start_col:end_col, :);
end
