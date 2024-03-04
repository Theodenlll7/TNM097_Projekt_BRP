function [out_images] = optimize_images2(image, in_images, k)
    image = rgb2lab(image);
   % Perform k-means clustering on the input image
    [~, centroids] = kmeans(image(:), k);
    
    % Calculate deltaE between centroids and images in the database
    num_in_images = numel(in_images);
    deltaE = zeros(num_in_images, k);
    for i = 1:num_in_images
        deltaE(i, :) = sqrt(sum((mean(in_images{i}(:)) - centroids).^2, 2));
    end

    % Sort each column of deltaE and keep track of original positions
    [sorted_deltaE, sorted_indices] = sort(deltaE);

    % Initialize variables to store output images and keep track of duplicates
    out_images = cell(1, k);
    used_images = false(1, num_in_images);

    % Loop through centroids and select the closest image
    for i = 1:k
        for j = 1:num_in_images
            index = sorted_indices(j, i);
            if ~used_images(index)
                out_images{i} = in_images{index};
                used_images(index) = true;
                break; % Move to the next centroid
            end
        end
    end
end