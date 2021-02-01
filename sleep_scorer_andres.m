%% definitions
baseName = pwd;
eeg_channels_for_scorer = [1 12]; % max 3 eeg channels to be used for the sleep scorer
file_pre_name = '100_CH';
file_post_name = '_2.continuous';
%reference_channels = [1 ];

movement_channels = {'100_AUX1_2.continuous', '100_AUX2_2.continuous', '100_AUX3_2.continuous'}; % names of the movement channels

% TODO
%eeg_data = convert open ephys data to matlab cell array
%% load eeg data 
eeg_data = cell(1, length(eeg_channels_for_scorer));
for i = 1:length(eeg_channels_for_scorer)
    filename = [file_pre_name num2str(eeg_channels_for_scorer(i)) file_post_name];
    [data,~,info] = load_open_ephys_data(filename);
    %filename_ref = [file_pre_name num2str(reference_channels(i)) file_post_name];
    %[data_ref] = load_open_ephys_data(filename_ref);
    %data = data-data_ref;
    data = resample(data, 1, 16);
    fs = info.header.sampleRate / 16;
    eeg_data{i} = data;
end

%% load movement channel
mov_data = cell(1,length(movement_channels));
for i = 1:length(movement_channels)
   filename = movement_channels{i};
   [data, ~, info] = load_open_ephys_data(filename);
   mov_data{i} = resample(data, 1, 16);
end


%% convert movement to matrix 

movement_data = [];
for i = 1:length(movement_channels)
    movement_data = [movement_data; mov_data{i}']; %#ok<AGROW>
end


%% pack input in inputData structure
inputData.rawEeg = eeg_data;
inputData.Chs = eeg_channels_for_scorer;
inputData.eegFS = fs; 
inputData.MotionType = 'Channels (accelerometer)';
inputData.motionSignal = movement_data;
inputData.mChs = [1 2 3];

%% run the scorer
TheStateEditor(baseName, inputData);
