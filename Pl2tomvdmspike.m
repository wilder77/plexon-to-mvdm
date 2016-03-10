%% Creates struct of spike time stamps for pre-sorted channels in mvdm format
% select file to load
name = 'Enter Number of files to analyze';
prompt = {'Number of Files'};
numlines = 1;
defaultparams = {'1'};
params = inputdlg(prompt,name,numlines,defaultparams);
numRep = str2double(params{1});

for Reps = 1:numRep
    [datafile,path] = uigetfile('D:\PlexonData\FerretCGdata'); % on Briggs lab data computer, can be changed to local data repository
    cd (path);
    
        data = PL2GetFileIndex(datafile);
        
        %%
        %Find channels with sorted units
        for k = 1:length(data.SpikeChannels)
            spikechan(k,1) = data.SpikeChannels{k,1}.NumberOfUnits > 0; %Integrity check: Makes sure spikes are from pre-sorted, optimized units
        end
        spikechan = find(spikechan); %creates an index to find channels with sorted units within larger data struct (named "data")
        for j = 1:length(spikechan)
            goodchannels(j,1) = data.SpikeChannels(spikechan(j,:)); %creates struct of channels with sorted units
        end
        %%
        %Create data structure containing sorted spikes with MvdM organization
        Spk = struct([]);
        Spk(1).type = 'ts';
        for i = 1:length(goodchannels);
            Spk(1).t{i} = PL2Ts(datafile,goodchannels{i}.Name,1);
            Spk(1).label{i} = datafile;
            Spk(1).cfg{i} = goodchannels{i};
        end
    
   
end