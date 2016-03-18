function tsevs = Pl2tomvdmevents(filelist)
%%
for r = 1:length(filelist)
 % get all event timestamps and labels from PL2 file and put into ts struct
    tsevs = struct([]);
    tsevs(1).type = 'ts';
   
   
    for l = 1:3 % Only ever record 3 events: stimulus cycle (1), trial start (2) and trial end (3)
        [numts,tsevs(1).t{l},sv] = plx_event_ts(filelist{r},l);
    end
end
