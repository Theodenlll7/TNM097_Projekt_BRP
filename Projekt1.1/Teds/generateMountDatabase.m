function generateMountDatabase()
   
    mount_data = struct('name', {}, 'average_rgb', {}, 'average_lab', {});

    num_images = 543;
    
    for i = 0:num_images
        % Read the image
        img = eval(sprintf('image_%d', i));

        % Extract file name from image variable name
        mount_name = sprintf('image_%d', i);

        % Calculate average RGB value
        average_rgb = mean(reshape(double(img), [], 3), 1);

        % Convert image to LAB color space
        lab_img = rgb2lab(img);

        % Calculate average LAB value
        average_lab = mean(reshape(lab_img, [], 3), 1);

        % Store data in structure array
        mount_data(i+1).name = mount_name;
        mount_data(i+1).average_rgb = average_rgb;
        mount_data(i+1).average_lab = average_lab;
    end

    % Save structure array to a .mat file
    save('mount_database.mat', 'mount_data');
end