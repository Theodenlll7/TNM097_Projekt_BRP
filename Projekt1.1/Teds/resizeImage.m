function resizedImage = resizeImage(image, newSize)
    currentSize = size(image);

    if newSize(1) > currentSize(1) || newSize(2) > currentSize(2)
        warning('The image needs to be enlarged. This may cause loss of quality.');
    end

    resizedImage = imresize(image, newSize, 'bilinear');
end