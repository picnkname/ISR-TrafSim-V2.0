%--------------------------------------------------------------------------
%                           ISR-TrafSim v2.0
%                        Copyright (C) 2010-2013
%
%--------------------------------------------------------------------------
% This Matlab file is part of the ISR-TrafSim: a Matlab
% library for traffic simulation and pose estimation in Urban environments,
% namely roundabouts and crossroads.
%
% http://www.isr.uc.pt/~conde/isr-trafsim/
%
%-CITATION---------------------------------------------------------------------------
% If you use this software please cite one of the following papers:
% 1) L.C.Bento, R.Parafita, S.Santos and U.Nunes, An Intelligent Traffic Management
% at Intersections legacy mode for vehicles not equipped with V2V and V2I Communications,
% 16th IEEE Int.Conf. Intelligent Transportation Systems, Netherlands, 2013.
% 2) L.C.Bento, R.Parafita and U.Nunes, Inter-vehicle sensor fusion for accurate vehicle
% localization supported by V2V and V2I communications, 15th IEEE Int.Conf. Intelligent
% Transportation Systems, USA, 2012.
% 3) L.C.Bento, R.Parafita and U.Nunes, Intelligent traffic management at intersections
% supported by V2V and V2I communications, 15th IEEE Int.Conf. Intelligent
% Transportation Systems, USA, 2012.
%
%-DESCRIPTION------------------------------------------------------------------------
%
% View next road (cross)
%
%-DISCLAIMER-------------------------------------------------------------------------
% This program is distributed in the hope that it will be useful,but WITHOUT ANY WARRANTY;
% without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
% You can use this source code without licensing fees only for NON-COMMERCIAL research
% and EDUCATIONAL purposes only.
% You cannot repost this file without prior written permission from the authors.
%
%-AUTHORS------------------------------------------------------------------
%   Urbano Nunes*
%   Luis Conde Bento**
%   Ricardo Parafita*
%   Sergio Santos*
%
%  *Institute of Systems and Robotics   - University of Coimbra
% **School of Technology and Management - Polytechnic Institute of Leiria
%--------------------------------------------------------------------------

function [nextroad] = check_road_ahead_isr_trafsim(n,road)
global c

dcross=20;
nextroad=0;
if(road>=5 && road<=10 || road==40 || road==15 || road==16)
    caution=0;
    cursetp=c.car(n).setp;
    curdist=c.car(n).traj(4,c.car(n).setp);
    while(curdist<c.car(n).traj(4,c.car(n).setp)+dcross)
        curdist=c.car(n).traj(4,cursetp);
        cursetp=cursetp+1;
        if(cursetp==c.car(n).trajn)
            caution=1;
            break
        end
    end
    if(caution)
        cursetp=c.car(n).trajn;
    end
    nextroad=max(c.car(n).traj(3,[c.car(n).setp:cursetp]));
end
end