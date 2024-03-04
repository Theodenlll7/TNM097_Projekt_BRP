function [deltaE] = deltaE(im, other_im)
    % Convert images to Lab color space
    im_lab = rgb2lab(im);
    im_other_lab = rgb2lab(other_im);

    % Calculate Euclidean distance in Lab space
    deltaE = sqrt(sum((im_lab - im_other_lab).^2, 3));
end
