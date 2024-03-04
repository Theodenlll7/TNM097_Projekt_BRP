function reconstructed_image = reconstructImage(base_image, images, tile_size)
    [rows, cols, ~] = size(base_image);
    reconstructed_image = zeros(rows, cols, 3, "double");
    base_image = rgb2lab(base_image);

    % Divide the base image into tiles
    num_rows = ceil(rows / tile_size);
    num_cols = ceil(cols / tile_size);

    % Iterate over tiles
    for r = 1:num_rows
        for c = 1:num_cols
            % Calculate tile boundaries
            row_start = (r - 1) * tile_size + 1;
            row_end = min(rows, r * tile_size);
            col_start = (c - 1) * tile_size + 1;
            col_end = min(cols, c * tile_size);

            % Extract tile from base image
            tile = base_image(row_start:row_end, col_start:col_end, :);

            % Replace tile with matching mount image
            image = get_closest_image(images, tile);
            
            reconstructed_image(row_start:row_end, col_start:col_end, :) = image;
        end
    end
    reconstructed_image = lab2rgb(reconstructed_image);
end
