#Convention
#Axes(1,:) = x
#Axes(2,:) = y
#Axes(3,:) = z
#Axes(4,:) = Density/Color/...

function [axeX, axeY, axeZ, Score] = ScoreFiltering_HPF_3d(axeX, axeY, axeZ, Score, Threshold)
 axeX = axeX(Score>=Threshold);
 axeY = axeY(Score>=Threshold);
 axeZ = axeZ(Score>=Threshold);
 Score = Score(Score>=Threshold);
endfunction