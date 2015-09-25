function Pulse = pulse_equation()
%   Get a 'function' from an image.
%   Insert an image to A and the result will be an approximate function that
%   represents the line

    A = imread('Signal Example.png');
    I = rgb2gray(A);
    BW = im2bw(I,0.7);

    [h , w] = size(BW);
    Pulse = zeros(1,w);

    for j = w:-1:1
        stop = 0;
        for i = h:-1:1
            if BW(i,j) == 0 && stop == 0;
                Pulse(j) = 255-i;
                stop=1;
            end
        end
    end

end