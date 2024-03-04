function reconstructed_image = reconstructImage(base_image, mount_data, tile_size, mount_size, color_space)
    % Check if image_0 exists
    if ~exist('image_0', 'var')
        % Call createdmatlabscrape if image_0 doesn't exist
        createdMatlabScrape();
    end

    [rows, cols, ~] = size(base_image);
    reconstructed_image = uint8(zeros(rows, cols, 3));

    % Resize the mount images
    for i = 1:numel(mount_data)
        mount_data(i).image = resizeImage(eval(['image_', num2str(i - 1)]), mount_size);
    end

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

            % Calculate average color value of the tile
            if strcmp(color_space, 'lab')
                tile_lab = rgb2lab(tile);
                average_color = mean(reshape(tile_lab, [], 3), 1);
                mount_data_color = cat(1, mount_data.average_lab);
            else % Default to RGB
                average_color = mean(reshape(double(tile), [], 3), 1);
                mount_data_color = cat(1, mount_data.average_rgb);
            end

            % Find the closest matching mount image in the database
            [~, idx] = min(pdist2(mount_data_color, average_color));

            % Replace tile with matching mount image
            mount_image = eval(['image_', num2str(idx - 1)]);
            mount_image_resized = imresize(mount_image, [size(tile, 1), size(tile, 2)]);
            reconstructed_image(row_start:row_end, col_start:col_end, :) = mount_image_resized;
        end
    end
end
