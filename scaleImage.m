function scaled_image = scaleImage(input_image, max_width, max_height, show_diff)
    % Input:
    % input_image: Den ursprungliga bilden
    % max_width: Maximal tillåten bredd för skalning
    % max_height: Maximal tillåten höjd för skalning
    % show_diff: 'show' för att visa skillnaden, 'dont show' för att inte visa
    % Output:
    % scaled_image: Den skalade bilden
    
    [original_height, original_width, ~] = size(input_image);
    scaling_factor = min(max_width/original_width, max_height/original_height);

    if scaling_factor < 1
        scaled_image = imresize(input_image, scaling_factor); % Skala om bilden
        disp('Bilden har skalats ner på grund av storleksbegränsningar.');
    else
        scaled_image = input_image;
        disp('Bilden är inom storleksbegränsningarna.');
    end
    
    if strcmpi(show_diff, 'show')
        % Visa skillnaden mellan originalet och den skalade bilden
        diff_image = imabsdiff(input_image, scaled_image);
        figure;
        imshow(diff_image);
        title('Skillnad mellan originalet och den skalade bilden');
    end
end
