%Events are stored in a matrix called EventList, where each row represents
%an event. Events are defined by time of ocurrence, type of event
%(1-arrival at flow or 2-departure from link) and number of resource. The
%routine sorts the event list, determines the next event, advances the
%simulation clock to the time of the next event, returns this event and
%removes it from the event list. 

function [nextEvent]=timing

global Time;
global EventList;

EventList=sortrows(EventList,1); %Sorts event list
nextEvent=EventList(1,:); %Determines next event
Time=nextEvent(1); %Advances clock
EventList(1,:)=[]; %Removes next event from event list