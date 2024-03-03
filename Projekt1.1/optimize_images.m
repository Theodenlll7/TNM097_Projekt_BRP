function out_images = optimize_images(in_images, k)
    num_images = numel(in_images);
    images_numeric = zeros([size(in_images{1}),num_images]);
    for i = 1:num_images
        all_images_numeric(:, :, :, i) = in_images{i};
    end

    % Reshape images to 1D vector
    vector_images = reshape(all_images_numeric, [], num_images)';

    % Perform k-means clustering
    [~, centroids] = kmeans(vector_images, k);

    % Find closest objects to the cluster centers
    distances_to_centroids = pdist2(vector_images, centroids);
    
    % Find closest centroids for each image
    [~, top_k_distances] = sort(distances_to_centroids, 2);
    top_k_distances = top_k_distances(:, 1:k);
    
    % Extract corresponding image indices
    [~, top_k_indices] = sort(top_k_distances, 1);
    top_k_indices = top_k_indices(1:k, :);

    % Select top k unique images (regardless of centroid)
    [unique_indices, ~, unique_inv_indices] = unique(top_k_indices(:));
    out_images = in_images(unique_indices(1:k));
end

