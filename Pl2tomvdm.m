%%
% load file and create pl2 struct
cd('C:\Users\Wilder\Desktop\eData');
fname = 'H12March5_pl2marked_FPonly.pl2';
pl2 = PL2GetFileIndex('H12March5_pl2marked_FPonly.pl2');

%%
% Display all ad channels in file
PL2Print(pl2.AnalogChannels)
%% create blank tsd called AdTs
AdTs = tsd([]);
%%
% Load all ad data and labels into tsd format struct called AdTs 
AdTs.data = nan(length(pl2.AnalogChannels),pl2.AnalogChannels{1,1}.NumValues);
for i = 1:length(pl2.AnalogChannels)
    AdTs.label{1,i} = pl2.AnalogChannels{i,1}.Name;
    temp = PL2Ad(fname, i);
    AdTs.data(i,:) = temp.Values;
end
%%
%remove nans
%AdTs.data(isnan(AdTs.data))=0; 
%%
% Add time vector to AdTs.tvec
[n, freqs] = plx_adchan_freqs(fname); 
AdTs.tvec = nan(1, pl2.AnalogChannels{1,1}.NumValues)
AdTs.tvec(1,:) = PL2StartStopTs(fname, 'start'):1/freqs(1):(pl2.AnalogChannels{1,1}.NumValues-1)/freqs(1);
TimeSampEr = PL2StartStopTs(fname, 'stop')- (length(AdTs.tvec)/freqs(1));
%%
% Display all event channels in file
PL2Print(pl2.EventChannels)
%%
% get all event timestamps and labels from PL2 file and put into ts struct
eventTs = ts([]);
for i = 1:length(pl2.EventChannels)
    eventTs.label{1,i} = pl2.EventChannels{i,1}.Name;
    temp = PL2EventTs(fname, i);
    eventTs.t{1,i} = temp.Ts;
end
%%
% housekeeping ???
%ts_out.cfg.history.mfun{1} = fname;
%ts_out.cfg.history.cfg{1} = [];


