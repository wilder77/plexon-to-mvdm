%% Creates struct of spike time stamps for pre-sorted channels in mvdm format from filelist of file paths
function [Spk] = Pl2tomvdmspike(filelist);
for r = 1:length(filelist)
    %%
    data(r) = PL2GetFileIndex(filelist{r,1});
    
    %%
    %Find channels with sorted units
    for k = 1:length(data(r).SpikeChannels)
        spikechan(k,1) = data(r).SpikeChannels{k,1}.NumberOfUnits > 0; %Integrity check: Makes sure spikes are from pre-sorted, optimized units
    end
    spikechan = find(spikechan); %creates an index to find channels with sorted units within larger data struct (named "data")
    for j = 1:length(spikechan)
        goodchannels(j,1) = data(r).SpikeChannels(spikechan(j,:)); %creates struct of channels with sorted units
    end

    %%
    %Create data structure containing sorted spikes with MvdM organization
    Spk = struct([]);
    Spk(1).type = 'ts';
    for i = 1:length(goodchannels);
        Spk(1).t{i} = PL2Ts(filelist{r},goodchannels{i}.Name,1);
        Spk(1).label{i} = goodchannels{i}.Name;
        Spk(1).cfg{i} = goodchannels{i};
    end
    
end