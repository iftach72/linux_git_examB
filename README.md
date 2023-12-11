# Outputs\n
## Pattern Keyword Count
14
## Command-Line Options
-n, --quiet, --silent
-e script, --expression=script
-f script-file, --file=script-file
--follow-symlinks
-i[SUFFIX], --in-place[=SUFFIX]
-c, --copy
-l N, --line-length=N
--posix
-r, --regexp-extended
-s, --separate
-u, --unbuffered
--help
--version
## Count of Unique Words in Lowercase sed Manual
name
sed - stream editor for filtering and transforming text

synopsis
sed [option]... {script-only-if-no-other-script} [input-file]...

description
sed is a stream editor. a stream editor is used to perform basic text transformations on an input stream (a file or input from a pipeline). while in some ways similar to an editor which permits scripted edits (such as ed), sed works by making only one pass over the input(s), and is consequently more efficient. but it is sed's ability to filter text in a pipeline which particularly distinguishes it from other types of editors.

-n, --quiet, --silent
suppress automatic printing of pattern space
-e script, --expression=script
add the script to the commands to be executed
-f script-file, --file=script-file
add the contents of script-file to the commands to be executed
--follow-symlinks
follow symlinks when processing in place; hard links will still be broken.
-i[suffix], --in-place[=suffix]
edit files in place (makes backup if extension supplied). the default operation mode is to break symbolic and hard links. this can be changed with --follow-symlinks and --copy.
-c, --copy
use copy instead of rename when shuffling files in -i mode. while this will avoid breaking links (symbolic or hard), the resulting editing operation is not atomic. this is rarely the desired mode; --follow-symlinks is usually enough, and it is both faster and more secure.
-l n, --line-length=n
specify the desired line-wrap length for the 'l' command
--posix
disable all gnu extensions.
-r, --regexp-extended
use extended regular expressions in the script.
-s, --separate
consider files as separate rather than as a single continuous long stream.
-u, --unbuffered
load minimal amounts of data from the input files and flush the output buffers more often
--help
display this help and exit

--version
output version information and exit
if no -e, --expression, -f, or --file option is given, then the first non-option argument is taken as the sed script to interpret. all remaining arguments are names of input files; if no input files are specified, then the standard input is read.
gnu sed home page: <http://www.gnu.org/software/sed/>. general help using gnu software: <http://www.gnu.org/gethelp/>. e-mail bug reports to: <bug-gnu-utils@gnu.org>. be sure to include the word ''sed'' somewhere in the ''subject:'' field.

command synopsis
this is just a brief synopsis of sed commands to serve as a reminder to those who already know sed; other documentation (such as the texinfo document) must be consulted for fuller descriptions.

zero-address ''commands''

: label
label for b and t commands.
#comment
the comment extends until the next newline (or the end of a -e script fragment).
}
the closing bracket of a { } block.

zero- or one- address commands

=
print the current line number.

a \

text

append text, which has each embedded newline preceded by a backslash.

i \

text

insert text, which has each embedded newline preceded by a backslash.

q [exit-code]
immediately quit the sed script without processing any more input, except that if auto-print is not disabled the current pattern space will be printed. the exit code argument is a gnu extension.
q [exit-code]
immediately quit the sed script without processing any more input. this is a gnu extension.
r filename
append text read from filename.
r filename
append a line read from filename. each invocation of the command reads a line from the file. this is a gnu extension.
commands which accept address ranges

{
begin a block of commands (end with a }).

b label
branch to label; if label is omitted, branch to end of script.
t label
if a s/// has done a successful substitution since the last input line was read and since the last t or t command, then branch to label; if label is omitted, branch to end of script.
t label
if no s/// has done a successful substitution since the last input line was read and since the last t or t command, then branch to label; if label is omitted, branch to end of script. this is a gnu extension.
c \
text

replace the selected lines with text, which has each embedded newline preceded by a backslash.

d

delete pattern space. start next cycle.

d

delete up to the first embedded newline in the pattern space. start next cycle, but skip reading from the input if there is still data in the pattern space.

h h

copy/append pattern space to hold space.

g g

copy/append hold space to pattern space.

x

exchange the contents of the hold and pattern spaces.

l

list out the current line in a ''visually unambiguous'' form.

l width
list out the current line in a ''visually unambiguous'' form, breaking it at width characters. this is a gnu extension.
n n
read/append the next line of input into the pattern space.

p

print the current pattern space.

p

print up to the first embedded newline of the current pattern space.

s/regexp/replacement/
attempt to match regexp against the pattern space. if successful, replace that portion matched with replacement. the replacement may contain the special character & to refer to that portion of the pattern space which matched, and the special escapes \1 through \9 to refer to the corresponding matching sub-expressions in the regexp.
w filename
write the current pattern space to filename.
w filename
write the first line of the current pattern space to filename. this is a gnu extension.
y/source/dest/
transliterate the characters in the pattern space which appear in source to the corresponding character in dest.
addresses
sed commands can be given with no addresses, in which case the command will be executed for all input lines; with one address, in which case the command will only be executed for input lines which match that address; or with two addresses, in which case the command will be executed for all input lines which match the inclusive range of lines starting from the first address and continuing to the second address. three things to note about address ranges: the syntax is addr1,addr2 (i.e., the addresses are separated by a comma); the line which addr1 matched will always be accepted, even if addr2 selects an earlier line; and if addr2 is a regexp, it will not be tested against the line that addr1 matched.

after the address (or address-range), and before the command, a ! may be inserted, which specifies that the command shall only be executed if the address (or address-range) does not match.

the following address types are supported:

number
match only the specified line number.

first~step
match every step'th line starting with line first. for example, ''sed -n 1~2p'' will print all the odd-numbered lines in the input stream, and the address 2~5 will match every fifth line, starting with the second. first can be zero; in this case, sed operates as if it were equal to step. (this is an extension.)
$
match the last line.

/regexp/
match lines matching the regular expression regexp.
\cregexpc
match lines matching the regular expression regexp. the c may be any character.
gnu sed also supports some special 2-address forms:
0,addr2
start out in "matched first address" state, until addr2 is found. this is similar to 1,addr2, except that if addr2 matches the very first line of input the 0,addr2 form will be at the end of its range, whereas the 1,addr2 form will still be at the beginning of its range. this works only when addr2 is a regular expression.
addr1,+n
will match addr1 and the n lines following addr1.
addr1,~n
will match addr1 and the lines following addr1 until the next line whose input line number is a multiple of n.
regular expressions
posix.2 bres should be supported, but they aren't completely because of performance problems. the \n sequence in a regular expression matches the newline character, and similarly for \a, \t, and other sequences.

bugs
e-mail bug reports to bonzini@gnu.org. be sure to include the word ''sed'' somewhere in the ''subject:'' field. also, please include the output of ''sed --version'' in the body of your report if at all possible.

copyright
copyright Â© 2009 free software foundation, inc.
this is free software; see the source for copying conditions. there is no warranty; not even for merchantability or fitness for a particular purpose, to the extent permitted by law.

gnu sed home page: <http://www.gnu.org/software/sed/>. general help using gnu software: <http://www.gnu.org/gethelp/>. e-mail bug reports to: <bug-gnu-utils@gnu.org>. be sure to include the word ''sed'' somewhere in the ''subject:'' field.

see also
awk(1), ed(1), grep(1), tr(1), perlre(1), sed.info, any of various books on sed, the sed faq (http://sed.sf.net/grabbag/tutorials/sedfaq.txt), http://sed.sf.net/grabbag/.

the full documentation for sed is maintained as a texinfo manual. if the info and sed programs are properly installed at your site, the command

info sed
should give you access to the complete manual.## SED Examples
Match every step'th line starting with line first. For example, ''sed -n 1~2p'' will print all the odd-numbered lines in the input stream, and the address 2~5 will match every fifth line, starting with the second. first can be zero; in this case, sed operates as if it were equal to step. (This is an extension.)
$
Match the last line.
## Regular Expressions in SED with Line Numbers
26:-r, --regexp-extended
27:use extended regular expressions in the script.
130:s/regexp/replacement/
131:Attempt to match regexp against the pattern space. If successful, replace that portion matched with replacement. The replacement may contain the special character & to refer to that portion of the pattern space which matched, and the special escapes \1 through \9 to refer to the corresponding matching sub-expressions in the regexp.
139:Sed commands can be given with no addresses, in which case the command will be executed for all input lines; with one address, in which case the command will only be executed for input lines which match that address; or with two addresses, in which case the command will be executed for all input lines which match the inclusive range of lines starting from the first address and continuing to the second address. Three things to note about address ranges: the syntax is addr1,addr2 (i.e., the addresses are separated by a comma); the line which addr1 matched will always be accepted, even if addr2 selects an earlier line; and if addr2 is a regexp, it will not be tested against the line that addr1 matched.
153:/regexp/
154:Match lines matching the regular expression regexp.
155:\cregexpc
156:Match lines matching the regular expression regexp. The c may be any character.
159:Start out in "matched first address" state, until addr2 is found. This is similar to 1,addr2, except that if addr2 matches the very first line of input the 0,addr2 form will be at the end of its range, whereas the 1,addr2 form will still be at the beginning of its range. This works only when addr2 is a regular expression.
165:POSIX.2 BREs should be supported, but they aren't completely because of performance problems. The \n sequence in a regular expression matches the newline character, and similarly for \a, \t, and other sequences.
14
-n, --quiet, --silent
-e script, --expression=script
-f script-file, --file=script-file
--follow-symlinks
-i[SUFFIX], --in-place[=SUFFIX]
-c, --copy
-l N, --line-length=N
--posix
-r, --regexp-extended
-s, --separate
-u, --unbuffered
--help
--version
Match every step'th line starting with line first. For example, ''sed -n 1~2p'' will print all the odd-numbered lines in the input stream, and the address 2~5 will match every fifth line, starting with the second. first can be zero; in this case, sed operates as if it were equal to step. (This is an extension.)
$
Match the last line.
26:-r, --regexp-extended
27:use extended regular expressions in the script.
130:s/regexp/replacement/
131:Attempt to match regexp against the pattern space. If successful, replace that portion matched with replacement. The replacement may contain the special character & to refer to that portion of the pattern space which matched, and the special escapes \1 through \9 to refer to the corresponding matching sub-expressions in the regexp.
139:Sed commands can be given with no addresses, in which case the command will be executed for all input lines; with one address, in which case the command will only be executed for input lines which match that address; or with two addresses, in which case the command will be executed for all input lines which match the inclusive range of lines starting from the first address and continuing to the second address. Three things to note about address ranges: the syntax is addr1,addr2 (i.e., the addresses are separated by a comma); the line which addr1 matched will always be accepted, even if addr2 selects an earlier line; and if addr2 is a regexp, it will not be tested against the line that addr1 matched.
153:/regexp/
154:Match lines matching the regular expression regexp.
155:\cregexpc
156:Match lines matching the regular expression regexp. The c may be any character.
159:Start out in "matched first address" state, until addr2 is found. This is similar to 1,addr2, except that if addr2 matches the very first line of input the 0,addr2 form will be at the end of its range, whereas the 1,addr2 form will still be at the beginning of its range. This works only when addr2 is a regular expression.
165:POSIX.2 BREs should be supported, but they aren't completely because of performance problems. The \n sequence in a regular expression matches the newline character, and similarly for \a, \t, and other sequences.
