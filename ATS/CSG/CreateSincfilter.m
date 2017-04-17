## Copyright (C) 2017 Olivier Sirois
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
## @deftypefn {Function File} {@var{retval} =} CreateSincfilter (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Olivier Sirois <olivier@olivier-ThinkPad-T530>
## Created: 2017-03-21

function [window] = createsincfilter (filterorderminone, normfreq)
#filterorderminone = 10;
#normfreq = 0.11;

for i=1:filterorderminone
if (i-(filterorderminone+1)/2) == 0
  value(i) = normfreq/pi;
else
  value(i) = sin((i-(filterorderminone+1)/2)*normfreq)/(pi*(i-(filterorderminone+1)/2));
endif
  
  endfor

plot(value)
window = value;
endfunction
