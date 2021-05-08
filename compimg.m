function imgoutput = compimg(imgfilename,compquality)
%COMPIMG Compress image
%   Compress image for DSP 1D project
    input = double(imread(imgfilename));
    [row,col] = size(input);
    output = zeros(row,col);
    for i = 1:8:row
        for j = 1:8:col
            sub_blk = input(i:i+7,j:j+7);
            output(i:i+7,j:j+7) = disccosxform(sub_blk);
        end
    end
    Q_Mat = [ 16	11	10	16	24	40	51	61;
    12	12	14	19	26	58	60	55;
    14	13	16	24	40	57	69	56;
    14	17	22	29	51	87	80	62;
    18	22	37	56	68	109 103 77;
    24	35	55	64	81	104 113 92;
    49	64	78	87	103 121 120 101;
    72	92	95	98	112 100 103 99];

    if compquality > 50
        Q = (1 - Q_Mat) * (compquality - 100) / 50 + 1;
    elseif compquality < 50
        Q = 50 * Q_Mat / compquality;
    else
        Q = Q_Mat;
    end

    [row,col] = size(output);
    cpimage = zeros(row,col);
    for i = 1:8:row
        for j = 1:8:col
            sub_blk = output(i:i+7,j:j+7);
            cpimage(i:i+7,j:j+7) = sub_blk ./ Q;
        end
    end
    cpimage = round(cpimage);
    
    [row,col] = size(cpimage);
    imgoutput = zeros(row,col);
    for i = 1:8:row
        for j = 1:8:col
            sub_blk = cpimage(i:i+7,j:j+7) .* Q;
            imgoutput(i:i+7,j:j+7) = invdisccosxform(sub_blk);
        end
    end    
end

