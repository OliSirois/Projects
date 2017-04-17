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
## @deftypefn {Function File} {@var{retval} =} filtertest (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Olivier Sirois <olivier@olivier-ThinkPad-T530>
## Created: 2017-03-19

function [retval] = filtertest (siglen, winlen)


  for j = 1:winlen
   # if (i-j) < 1
  #    Final(i) = Final(i) + window(j)*currencysignal(abs(i-j)+1);
 #   else
      Final(j) = rem(abs(siglen-j),siglen)+1;
#    endif
  endfor
retval = Final;
plot(retval);
endfunction
