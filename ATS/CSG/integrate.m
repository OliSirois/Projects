## Copyright (C) 2017 ExtraZest
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} integrate (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ExtraZest <extrazest@HomeBase>
## Created: 2017-01-03

function [value] = integrate (input, OldValue, Order)
value(1:length(input)) =input;
for i = 1:Order

    for j = 2:length(input)
        value(j) = value(j-1)+value(j);  
    
    endfor
  endfor  
value(1:length(input)) = value(1:length(input)) + OldValue;
endfunction

