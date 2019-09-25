clc
clear
close all

addpath("..")% Not needed if +PropPrelib folder is in your current path.

import PropPrelib.*;

units BE;
dragmodel FutureFighter;
enginemodel LBTF;

mcfg.TR = 1.07;
mcfg.TLto = 1.24;
mcfg.WLto = 70; %psf

beta(1) = 0.9;

PI(1) = Maneuver.E('beta', beta(end),...
                 'M'   , 0.9,... 
                 'alt' , 42000,...
                 'D'   , 200*5280,...
                 mcfg); %Rest of mission parameters
            
beta(end+1) = PI(end)*beta(end);

PI(end+1) = Maneuver.E('beta', beta(end),...
                 'M'   , 1.6     ,... 
                 'alt' , 30000   ,...
                 'D'   , 100*5280,...
                 mcfg); %Rest of mission parameters
             
beta(end+1) = PI(end)*beta(end);

PI(end+1) = Maneuver.F('beta', beta(end),...
                 'M'   , 0.9    ,... 
                 'alt' , 30000   ,...
                 'n'  , 4.5,...
                 'Turns', 1,...
                 mcfg); %Rest of mission parameters
         
beta(end+1) = PI(end)*beta(end);

hold on
bar(PI)
plot(beta,'LineWidth',3)
xlabel('Maneuver')
xticks(1:length(PI))
legend('PI', 'Beta')