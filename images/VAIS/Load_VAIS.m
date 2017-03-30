%--------------------------------------------------------------------------
% This function loads the annotations for VAIS for processing in MATLAB.
%
% Input:    root is the path to the dataset
%
% Output:   EO_Train is a cell array containing the paths to the RGB 
%           training images. It is paired with IR_Train.
%           IR_Train is a cell array containing the paths to the IR 
%           training images. It is paired with EO_Train.
%           Train_Labels is an array of integers that represent the class
%           in EO_Train and IR_Train.
%           Train_Night is a boolean array that indicates if the image was
%           taken at night.
%           EO_Test, IR_Test, and Test_Labels, and Test_Night are similarly
%           defined to the Train variables.
%           Class_Names is a cell array of class names that can be used
%           with Train_Labels and Test_Labels to look up the string that
%           the class belongs to.
%
% Citation:
% 
% Zhang, M.M, Choi, J., Daniilidis, K., Wolf, M.T. & Kanan, C. (2015) VAIS: A
% Dataset for Recognizing Maritime Imagery in the Visible and Infrared
% Spectrums. In: Proc of the 11th IEEE Workshop on Perception Beyond the Visible
% Spectrum (PBVS-2015).
%--------------------------------------------------------------------------
function [EO_Train, IR_Train, Train_Labels, Train_Night, EO_Test, IR_Test, Test_Labels, Test_Night, Class_Names] = Load_VAIS(root)

compute_statistics = false;

fname = 'annotations.txt';

fid = fopen(fullfile(root, fname), 'rt');
C = textscan(fid, '%s %s %s %s %d %d %d');
fclose(fid);

EO_Files = C{1};
IR_Files = C{2};
FG_Labels = C{3};
Basic_Labels = C{4};
ID = C{5};
isTrain = C{6} == 1;
isNight = C{7} == 1;


FG_Class_Names = unique(FG_Labels);
Basic_Class_Names = unique(Basic_Labels);


eo_total = Count_Files(EO_Files);
ir_total = Count_Files(IR_Files);

fprintf('Total IR Images: %d\n', ir_total);
fprintf('Total Visible Images: %d\n', eo_total);
fprintf('Total Images: %d\n', eo_total + ir_total);
fprintf('Total Pairs: %d\n', Count_Pairs(EO_Files, IR_Files));
fprintf('Number of unique ships: %d\n', length(unique(ID)));
fprintf('Number of Night IR Images: %d\n', Count_Files(IR_Files(isNight)));
fprintf('Number of Fine-Grained Categories: %d\n', length(FG_Class_Names));
fprintf('Number of Basic Categories: %d\n', length(Basic_Class_Names));

if compute_statistics
    Output_Subclass_Totals(Basic_Labels, FG_Labels, ID);
    Display_Image_Stats('Visible', root, EO_Files);
    Display_Image_Stats('IR', root, IR_Files);
end

FG_Labels = Basic_Labels; %fprintf('Ignoring Fine-Grained Labels\n'); %temporary


[Class_Names, ~, IC] = unique(FG_Labels);

FG_Labels = IC;



eoNull = false(length(EO_Files), 1);
irNull = false(length(IR_Files), 1);
for k = 1:length(EO_Files)
    if strcmpi(EO_Files{k}, 'null')
        EO_Files{k} = '';
        eoNull(k) = true;
    else
        EO_Files{k} = fullfile(root, EO_Files{k});
    end
    if strcmpi(IR_Files{k}, 'null')
        IR_Files{k} = '';
        irNull(k) = true;
    else
        IR_Files{k} = fullfile(root, IR_Files{k});
    end
end



EO_Train = EO_Files(isTrain);
EO_Test = EO_Files(~isTrain);
IR_Train = IR_Files(isTrain);
IR_Test = IR_Files(~isTrain);
Train_Night = isNight(isTrain);
Test_Night = isNight(~isTrain);
Train_Labels = FG_Labels(isTrain);
Test_Labels = FG_Labels(~isTrain);

%----------------------------------------
function total = Count_Files(files)

total = 0;
for k = 1:length(files)
    if ~strcmpi(files{k}, 'null')
        total = total + 1;
    end
end

%----------------------------------------
function total = Count_Pairs(files1, files2)

total = 0;
for k = 1:length(files1)
    if ~strcmpi(files1{k}, 'null') && ~strcmpi(files2{k}, 'null')
        total = total + 1;
    end
end

%----------------------------------------
function Output_Subclass_Totals(Basic_Labels, FG_Labels, ID)

[C, IA, IC] = unique(Basic_Labels);

for k = 1:length(C)
    mask = IC == k;
    
    ID_k = ID(mask);
    
    [Ck, IAk, ICk] = unique(FG_Labels(mask));
    
    id_count = zeros(length(Ck), 1);
    for j = 1:length(Ck)
        mask_j = ICk == j;
        id_count(j) = length(unique(ID_k(mask_j)));
    end
    
    hc = id_count;
    %hc = hist(ICk, 1:length(Ck));
    
    s = [C{k}, ': '];
    for j = 1:length(Ck)
        s_j = sprintf('%d %s', hc(j), Ck{j});
        s = [s, s_j];
        if j < length(Ck)
            s = [s, ', '];
        end
    end
    fprintf('%s\n', s);
end

%--------------------------------------------------------
function Display_Image_Stats(desc, root, files)

sizes = [];

tt = 0;
for k = 1:length(files)
    if ~strcmpi(files{k}, 'null')
        img = imread(fullfile(root, files{k}));
        tt = tt + 1;
        sizes(tt, :) = [size(img, 1), size(img, 2)];
    end    
end

area = prod(sizes, 2);

fprintf('%s Area stats\n', desc);
fprintf('Mean: %d\n', round(mean(area)));
fprintf('Median: %d\n', median(area));
fprintf('Range: %d -- %d\n', min(area), max(area));

0;
