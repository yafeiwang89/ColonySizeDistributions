function [I_out] = green_mask(I, threshold)
% [I_out] = redgreen_mask(I, threshold); This function obtains the regions
% covered by red or green fluorescent signal. The 'threshold' value is used
% in the binarization step.

    % Background Correction
I = imtophat(I, strel('disk', 80));
I_out = imadjust(I, [0; 0.20], [0; 0.9], 1.5); 
%figure, imshow(I_out), title('Log transform')
I_out = imgaussfilt(I_out, 1);
%figure, imshow(I_out), title('Blurred')

    % Thresholding
I_out = imopen(I_out, strel('disk', 2));
I_out = imbinarize(I_out, threshold);
%I_out = imerode(I_out, strel('disk', 1));
I_out = imfill(I_out, 'holes');
%figure, imshow(I_out), title('GFP binarized')
end

