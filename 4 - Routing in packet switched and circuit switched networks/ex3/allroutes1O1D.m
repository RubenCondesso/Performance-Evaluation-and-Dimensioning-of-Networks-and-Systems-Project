function PathLinks = allroutes1O1D(Topology,oNode,dNode)

%This routine determines all routes from one origin to one destination,
%given the topology matrix.

%The routine iterates by building routes with i+1 nodes from routes with i
%nodes, starting from the origin node, and ending when no routes with a
%higher number of nodes are found. Matrices tempPathNodes1 and
%tempPathNodes2 store routes with a specific number of nodes, with one
%route per row; the routes are defined in terms of the sequence of nodes;
%tempPathNodes1 is initiated with the origin node and tempPathNodes2 is
%initiated empty; in each iteration, tempPathNodes2 builds routes with i+1
%nodes from tempPathNodes1 which stores routes with i nodes. At the end of
%each iteration the routes from tempPathNodes2 that end in destination node
%dNode are stored in tempPathNodes3. Matrix tempPathLinks is the equivalent
%of tempPathNodes3 but with the routes defined in terms of the sequence of
%links rather then the sequence of nodes.

%The routine returns the cell array PathLinks that in cell i stores a
%matrix with all routes with i links starting in the origin node oNode and
%ending in destination node dNode

tempPathNodes1=[oNode];

while 1
    NumPaths=size(tempPathNodes1,1);
    tempPathNodes2=[];
    for i=1:NumPaths
        LastNode=tempPathNodes1(i,end); %Determines last node in the route
        Neighbours=find(Topology(LastNode,:)); %Determines neighbours of last node
        if isempty(Neighbours) %If last node has no neighbours jump to next route
            continue;
        end
        for j=1:length(Neighbours) %For each neighbour
            if length(find(tempPathNodes1(i,:)-Neighbours(j)))==length(tempPathNodes1(i,:)); %If no cycle, i.e, neigbour not in previous route
                tempPathNodes2(end+1,:)=[tempPathNodes1(i,:),Neighbours(j)]; %Build new route by adding neighbour to previous route and store in tempPathNodes2 matrix
            end
        end
    end
    if isempty(tempPathNodes2) %If no more routes are found end routine
        break;
    else
    tempPathNodes1=tempPathNodes2; %Copy tempPathNodes2 to tempPathNodes1;
    NumPaths2=size(tempPathNodes2,1); %Determines number of routes of tempPathNodes2
    NumLinksPaths=size(tempPathNodes2,2)-1; %Determines number of links in routes of tempPathNodes2
    %Removes routes that do not end in dNode
    tempPathNodes3=[];
    kk=1;
    for m=1:NumPaths2
        if tempPathNodes2(m,end)==dNode
            tempPathNodes3(kk,:)=tempPathNodes2(m,:);
            kk=kk+1;
        end
    end
    %Builds routes in terms of number of links
    tempPathLinks=[];
    for m=1:kk-1
        for n=1:NumLinksPaths
            tempPathLinks(m,n)=Topology(tempPathNodes3(m,n),tempPathNodes3(m,n+1));
        end
    end
    PathLinks{NumLinksPaths}=tempPathLinks; %Store tempPathLinks in cell array PathLinks indexed on the number of links in the routes of tempPathLinks
    end
end
        