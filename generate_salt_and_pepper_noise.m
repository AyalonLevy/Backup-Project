function [ noise_matrix ] = generate_salt_and_pepper_noise( matrix_size, value1, probability1, value2, probability2 )

overall_samples = matrix_size(1) * matrix_size(2);
noise_samples = randsample([value1, value2], overall_samples, true, [probability1, probability2]);

noise_matrix = reshape( noise_samples, matrix_size );

end

