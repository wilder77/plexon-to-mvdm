%Plots LED pulse PSTH for optogenetically driven neurons in V1
%%
Spk = Pl2tomvdmspike(filelist); % calls function Pl2tomvdmspike to create structure of spike time stamps for pre-sorted units
tsevs = Pl2tomvdmevents(filelist); %calls function Pl2tomvdmevents to create structure of event time stamps, in this case LED pulses

for r = 1:length(Spk.t); % plots a PSTH for each unit in Spk data structure
binsize = 1; %ms
trlength = 0:binsize:size(tsevs.t{1}); %length of trial

 %%
edges = 0:binsize:trlength(end);
spkts = Spk.t{1,r};

psth = histc(spkts,edges);
%%
figure
bar(edges(1:end),psth);
hold on
axis([-10,100,0,max(psth)]);
xlabel('Time(s)');
ylabel('Firing Rate(hz)');

end