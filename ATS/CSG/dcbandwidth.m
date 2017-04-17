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
## @deftypefn {Function File} {@var{retval} =} sigbandwidth (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Olivier Sirois <olivier@olivier-ThinkPad-T530>
## Created: 2017-03-22

function [freq] = dcbandwidth (sig, bandpower, fsample)
freqs = 0:fsample/length(sig):0.5*fsample;
psd = sig(1:length(sig)/2).^2;
powersum = sum(psd);
thresh = bandpower*powersum;
freq = 0.5;
value = 0;
for i= 1:length(psd)
  value = value+psd(i);
  if value > thresh
    freq = freqs(i);
    break
  endif  

endfor

endfunction
