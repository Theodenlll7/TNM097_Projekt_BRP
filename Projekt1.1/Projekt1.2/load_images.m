function [images] = load_images(imageDir)
    % Get a list of all files in the directory
    files = dir(fullfile(imageDir, '*.jpg'));
    numImages = numel(files);

    % Read the first image to get dimensions and type
    firstImage = imread(fullfile(imageDir, files(1).name));

    % Initialize the array to store images
    %images = zeros(targetHeight, targetWidth, size(firstImage, 3), numImages, "double");
    images = cell(numImages, 1);
    means = zeros(numImages, 3);
    % Read, resize, and store images
    for i = 1:numImages
        img = imread(fullfile(imageDir, files(i).name));
        img = rgb2lab(img);
        images{i} = img;
    end
end
