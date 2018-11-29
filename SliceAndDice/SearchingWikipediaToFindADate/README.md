# A script for finding dates in text

This read me is just some notes on cleaning and tests

## How I cleaned: 
sed -i "/=/d;/Accessed/d;/Retrieved/d;/\./d" inProgressProcess 
sed -i "s/^ //g;s/,//g;s/[^0-9]*$//g" inProgressProcess
sed -n "/.* .* .*/p" -i .inProgressProcess
pv inProgressProcess | TZ=UTC xargs -I@ date --date="@" +%Y-%m-%d >> inProgressReformatted 2> errors

# First test
bzgrep -o -f DateExpressions.list enwiki-20170820-pages-articles-multistream.xml.bz2 > .testrun

# Probably over the top date grepping
    > 1[0-9][0-9][0-9]0[0-9]3[01]2[0-3][0-5][0-9][0-5][0-9]
    > 1[0-9][0-9][0-9]1[0-2]3[01]2[0-3][0-5][0-9][0-5][0-9]
    > 2[01][0-9][0-9]0[0-9]3[01]2[0-3][0-5][0-9][0-5][0-9]
    > 2[01][0-9][0-9]1[0-2]3[01]2[0-3][0-5][0-9][0-5][0-9]
    > 1[0-9][0-9][0-9]0[0-9][0-2][0-9]2[0-3][0-5][0-9][0-5][0-9]
    > 1[0-9][0-9][0-9]1[0-2][0-2][0-9]2[0-3][0-5][0-9][0-5][0-9]
    > 2[01][0-9][0-9]0[0-9][0-2][0-9]2[0-3][0-5][0-9][0-5][0-9]
    > 2[01][0-9][0-9]1[0-2][0-2][0-9]2[0-3][0-5][0-9][0-5][0-9]
    > 1[0-9][0-9][0-9]0[0-9]3[01][01][0-9][0-5][0-9][0-5][0-9]
    > 1[0-9][0-9][0-9]1[0-2]3[01][01][0-9][0-5][0-9][0-5][0-9]
    > 2[01][0-9][0-9]0[0-9]3[01][01][0-9][0-5][0-9][0-5][0-9]
    > 2[01][0-9][0-9]1[0-2]3[01][01][0-9][0-5][0-9][0-5][0-9]
    > 1[0-9][0-9][0-9]0[0-9][0-2][0-9][01][0-9][0-5][0-9][0-5][0-9]
    > 1[0-9][0-9][0-9]1[0-2][0-2][0-9][01][0-9][0-5][0-9][0-5][0-9]
    > 2[01][0-9][0-9]0[0-9][0-2][0-9][01][0-9][0-5][0-9][0-5][0-9]
    > 2[01][0-9][0-9]1[0-2][0-2][0-9][01][0-9][0-5][0-9][0-5][0-9]