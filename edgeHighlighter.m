% reads in image file
I = imread("purpleYellow.png");
% converts image to grayscale
I = double(rgb2gray(I));
% all rgb values are the same for I
dimensions = size(I);
% sobel matrices
sobelHorizontal = [-1 0 1; -2 0 2; -1 0 1];
sobelVertical = [1 2 1; 0 0 0; -1 -2 -1];
% sensitivity
sensitivity = 5;
vectors = zeros(dimensions(1), dimensions(2));
edges = zeros(dimensions(1), dimensions(2));
for i = 2:dimensions(1)-1
    for j = 2:dimensions(2)-1
        h = sum(sum(sobelHorizontal .* I(i-1:i+1, j-1:j+1,1)));
        v = sum(sum(sobelVertical .* I(i-1:i+1, j-1:j+1,1)));
        vectorLength = sqrt(h^2 + v^2);
        vectors(i, j, 1) = vectorLength;
        if (abs(vectorLength) > sensitivity) 
            edges(i, j) = 1;
        end
    end
end
imwrite(edges,"edges.PNG");