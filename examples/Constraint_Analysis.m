clc
clear
close all

addpath("..")% Not needed if +PropPrelib folder is in your current path.

import PropPrelib.*;

units BE;
atmodel Standard;
enginetype LBTF;
dragmodel FutureFighter;

WL = linspace(20,120);
TR = 1.06;

%ConstantAltitudeSpeedCruise
TLa = Constraint.A('WL'      , WL  ,...
                   'beta'    , 0.95,...
                   'TR'      , TR  ,...
                   'M'       , 0.9 ,...
                   'alt'     , 42E3,...
                   'Throttle', 'max');

%HorizontalAcceleration
TLd = Constraint.D('WL'        , WL  ,...
                   'beta'      , 0.78,...
                   'TR'        , TR  ,...
                   'alt'       , 30E3,...
                   'dt'        , 45  ,...
                   'M1'        , 0.8 ,...
                   'M2'        , 1.6 ,...
                   'Throttle'  , 'max');
 
hold on
plot(WL, TLa);
%plot(WL, TLb);
%plot(WL, TLc);
plot(WL, TLd);
ylabel('TL');
xlabel('WL');
legend(Constraint.A.name, Constraint.D.name);
              
 