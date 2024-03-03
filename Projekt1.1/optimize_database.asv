function out_images = optimize_database(in_images, k)
    image_size = size(in_images{1})
    images_numeric = zeros([image_size, num_images]);
    for i = 1:num_images
        all_images_numeric(:, :, :, i) = in_images{i};
    end


    % Reshape images to 1D vector
    flat_images = reshape(all_images_numeric, [], num_images)';

    % Perform k-means clustering
    [~, centroids] = kmeans(data, k);

    % Find closest objects to the cluster centers
    images = cell(k, 1);
    means = zeros(k, 3);
    distances_to_centroid = pdist2(data, centroids);
    [~, min_idxs] = min(distances_to_centroid, [], 1);
    for j = 1:k
        % Reshape image from numeric array to original size
        images{j} = reshape(all_images_numeric(:, :, :, min_idxs(j)), image_size);
        means(j, :) = mean(images{j}(:));
    end
end

