%% Creates cell arrays of spike time stamps for pre-sorted channels
% select file to load
[datafile,path] = uigetfile('D:\PlexonData\FerretCGdata'); % on Briggs lab data computer, can be changed to local data repository 
cd (path);
data = PL2GetFileIndex(datafile);

%% 
%Find channels with sorted units
for k = 1:length(data.SpikeChannels)
    spikechan(k,1) = data.SpikeChannels{k,1}.NumberOfUnits > 0;
end
spikechan = find(spikechan); %creates an index to find channels with sorted units within larger data struct (named "data")
for j = 1:length(spikechan)
goodchannels(j,1) = data.SpikeChannels(spikechan(j,:)); %creates struct of channels with sorted units
end
%%
%Add spike timestamps for Unit As
UnitAspikets = cell(30,1);
for i = 1:length(goodchannels);
UnitAspikets{i,:} = PL2Ts(datafile,goodchannels{i,1}.Name,1); %creates a cell with Unit A spike ts
end
%%
%Add spike timestamps for Unit Bs
UnitBspikets = cell(30,1);
for i = 1:length(goodchannels);
UnitBspikets{i,:} = PL2Ts(datafile,goodchannels{i,1}.Name,2); %creates a cell with Unit B spike ts
end
%%
%Add spike timestamps for Unit Cs
UnitCspikets = cell(30,1);
for i = 1:length(goodchannels);
UnitCspikets{i,:} = PL2Ts(datafile,goodchannels{i,1}.Name,3); %creates a cell with Unit C spike ts
end
