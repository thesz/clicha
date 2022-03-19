Descriptioin
================

If temperature has lognormal distribution [1], then increase of the number of observations of temperature will increase average temperature recorded. E.g., adding weather station will increase average temperature in a region.

[1] https://www.itm-conferences.org/articles/itmconf/pdf/2021/01/itmconf_icmsa2021_01010.pdf - "Temperature maximums best fit with lognormal and/or Weibull distributions"

This can mean anything, but is interesting.


What's in a.hs
===================

a.hs, per execution of ```main``` function in it, will print a "CSV"-compatible table which can be imported into LibreOffice Calc, for example.

This table shows recorded average for 10000..11900 samples.

After fitting data in Calc, I've got f(nsamples) = 0.00029*nsamples + 340.756,

R2 is, of course, all over the place.

Still, a positive correlation.
