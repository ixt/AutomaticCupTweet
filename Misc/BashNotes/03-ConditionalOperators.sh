#!/bin/bash
printf "Open this file in a text editor\r" 
exit 1
# from GNU Bash manual
[[ -a $file ]] && True if $file exists
[[ -b $file ]] && True if $file exists and is a block special file.
[[ -c $file ]] && True if $file exists and is a character special file.
[[ -d $file ]] && True if $file exists and is a directory.
[[ -e $file ]] && True if $file exists.
[[ -f $file ]] && True if $file exists and is a regular file.
[[ -g $file ]] && True if $file exists and its set-group-id bit is set.
[[ -h $file ]] && True if $file exists and is a symbolic link.
[[ -k $file ]] && True if $file exists and its "sticky" bit is set.
[[ -p $file ]] && True if $file exists and is a named pipe (FIFO).
[[ -r $file ]] && True if $file exists and is readable.
[[ -s $file ]] && True if $file exists and has a size greater than zero.
[[ -t $fd ]] && True if file descriptor $fd is open and refers to a terminal.
[[ -u $file ]] && True if $file exists and its set-user-id bit is set.
[[ -w $file ]] && True if $file exists and is writable.
[[ -x $file ]] && True if $file exists and is executable.
[[ -G $file ]] && True if $file exists and is owned by the effective group id.
[[ -L $file ]] && True if $file exists and is a symbolic link.
[[ -N $file ]] && True if $file exists and has been modified since it was last read.
[[ -O $file ]] && True if $file exists and is owned by the effective user id.
[[ -S $file ]] && True if $file exists and is a socket.
[[ $file1 -ef $file2 ]] && True if $file1 and $file2 refer to the same device and inode numbers.
[[ $file1 -nt $file2 ]] && True if $file1 is newer (according to modification date) than $file2, or if $file1 exists and $file2 does not.
[[ $file1 -ot $file2 ]] && True if $file1 is older than $file2, or if $file2 exists and $file1 does not.
[[ -o $optname ]] && True if the shell option $optname is enabled. The list of options appears in the description of the -o option to the set builtin (see The Set Builtin).
[[ -v $varname ]] && True if the shell variable varname is set (has been assigned a value).
[[ -R $varname ]] && True if the shell variable varname is set and is a name reference.
[[ -z $string ]] && True if the length of string is zero.
[[ -n $string ]] && True if the length of string is non-zero.
[[ $string1 == $string2 ]] && True if the strings are equal. When used with the [[ command, this performs pattern matching as described above (see Conditional Constructs).
[[ $string1 != $string2 ]] && True if the strings are not equal.
[[ $string1 < $string2 ]] && True if $string1 sorts before $string2 lexicographically.
[[ $string1 > $string2 ]] && True if $string1 sorts after $string2 lexicographically.
