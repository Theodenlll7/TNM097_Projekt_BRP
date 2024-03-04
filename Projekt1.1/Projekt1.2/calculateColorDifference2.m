function [deltaE, deltaEMean, deltaEMax] = calculateColorDifference2(Original_im, Other_im)
    % Convert images to Lab color space
    Lab_original = rgb2lab(Original_im);
    Lab_other = rgb2lab(Other_im);

    % Calculate Euclidean distance in Lab space
    deltaE = sqrt(sum((Lab_original - Lab_other).^2, 3));

    % Calculate mean and maximum deltaE
    deltaEMean = mean(deltaE, 'all');
    deltaEMax = max(deltaE, [], 'all');
end
