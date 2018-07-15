<table cellspacing="0" cellpadding="0">

<tbody>

<tr>

<th>Key</th>

<th>Action</th>

<th>Followed by</th>

</tr>

<tr>

<td>a</td>

<td>enter insertion mode after current character</td>

<td>text, ESC</td>

</tr>

<tr>

<td>b</td>

<td>back [word](#defs)</td>

</tr>

<tr>

<td>c</td>

<td>change command</td>

<td>[cursor motion command](#defs)</td>

</tr>

<tr>

<td>d</td>

<td>delete command</td>

<td>[cursor motion command](#defs)</td>

</tr>

<tr>

<td>e</td>

<td>end of [word](#defs)</td>

</tr>

<tr>

<td>f</td>

<td>find character after cursor in current line</td>

<td>character to find</td>

</tr>

<tr>

<td>g</td>

<td>[UNBOUND](#defs)</td>

</tr>

<tr>

<td>h</td>

<td>move left one character</td>

</tr>

<tr>

<td>i</td>

<td>enter insertion mode before current character</td>

<td>text, ESC</td>

</tr>

<tr>

<td>j</td>

<td>move down one line</td>

</tr>

<tr>

<td>k</td>

<td>move up one line</td>

</tr>

<tr>

<td>l</td>

<td>move right one character</td>

</tr>

<tr>

<td>m</td>

<td>mark current line and position</td>

<td>mark character tag (a-z)</td>

</tr>

<tr>

<td>n</td>

<td>repeat last search</td>

</tr>

<tr>

<td>o</td>

<td>open line below and enter insertion mode</td>

<td>text, ESC</td>

</tr>

<tr>

<td>p</td>

<td>put buffer after cursor</td>

</tr>

<tr>

<td>q</td>

<td>[UNBOUND](#defs)</td>

</tr>

<tr>

<td>r</td>

<td>replace single character at cursor</td>

<td>replacement character expected</td>

</tr>

<tr>

<td>s</td>

<td>substitute single character with new text</td>

<td>text, ESC</td>

</tr>

<tr>

<td>t</td>

<td>same as "f" but cursor moves to just before found character</td>

<td>character to find</td>

</tr>

<tr>

<td>u</td>

<td>undo</td>

</tr>

<tr>

<td>v</td>

<td>[UNBOUND](#defs)</td>

</tr>

<tr>

<td>w</td>

<td>move foreward one [word](#defs)</td>

</tr>

<tr>

<td>x</td>

<td>delete single character</td>

</tr>

<tr>

<td>y</td>

<td>yank command</td>

<td>[cursor motion command](#defs)</td>

</tr>

<tr>

<td>z</td>

<td>position current line</td>

<td>CR = top; "." = center; "-"=bottom</td>

</tr>

<tr>

<td>A</td>

<td>enter insertion mode after end of line</td>

<td>text, ESC</td>

</tr>

<tr>

<td>B</td>

<td>move back one [Word](#defs)</td>

</tr>

<tr>

<td>C</td>

<td>change to end of line</td>

<td>text, ESC</td>

</tr>

<tr>

<td>D</td>

<td>delete to end of line</td>

</tr>

<tr>

<td>E</td>

<td>move to end of [Word](#defs)</td>

</tr>

<tr>

<td>F</td>

<td>backwards version of "f"</td>

<td>character to find</td>

</tr>

<tr>

<td>G</td>

<td>goto line number prefixed, or goto end if none</td>

</tr>

<tr>

<td>H</td>

<td>home cursor - goto first line on screen</td>

</tr>

<tr>

<td>I</td>

<td>enter insertion mode before first non-whitespace character</td>

<td>text, ESC</td>

</tr>

<tr>

<td>J</td>

<td>join current line with next line</td>

</tr>

<tr>

<td>K</td>

<td>[UNBOUND](#defs)</td>

</tr>

<tr>

<td>L</td>

<td>goto last line on screen</td>

</tr>

<tr>

<td>M</td>

<td>goto middle line on screen</td>

</tr>

<tr>

<td>N</td>

<td>repeat last search, but in opposite direction of original search</td>

</tr>

<tr>

<td>O</td>

<td>open line above and enter insertion mode</td>

<td>text, ESC</td>

</tr>

<tr>

<td>P</td>

<td>put buffer before cursor</td>

</tr>

<tr>

<td>Q</td>

<td>leave visual mode (go into "ex" mode)</td>

</tr>

<tr>

<td>R</td>

<td>replace mode - replaces through end of current line, then inserts</td>

<td>text, ESC</td>

</tr>

<tr>

<td>S</td>

<td>substitute entire line - deletes line, enters insertion mode</td>

<td>text, ESC</td>

</tr>

<tr>

<td>T</td>

<td>backwards version of "t"</td>

<td>character to find</td>

</tr>

<tr>

<td>U</td>

<td>restores line to state when cursor was moved into it</td>

</tr>

<tr>

<td>V</td>

<td>[UNBOUND](#defs)</td>

</tr>

<tr>

<td>W</td>

<td>foreward [Word](#defs)</td>

</tr>

<tr>

<td>X</td>

<td>delete backwards single character</td>

</tr>

<tr>

<td>Y</td>

<td>yank entire line</td>

</tr>

<tr>

<td>Z</td>

<td>first half of quick save-and-exit</td>

<td>"Z"</td>

</tr>

<tr>

<td>0</td>

<td>move to column zero</td>

</tr>

<tr>

<td>1-9</td>

<td>[numeric precursor to other commands](#prefix)</td>

<td>[additional numbers (0-9)] command</td>

</tr>

<tr>

<td> </td>

<td>(SPACE) move right one character</td>

</tr>

<tr>

<td>!</td>

<td>shell command filter</td>

<td>[cursor motion command](#defs), shell command</td>

</tr>

<tr>

<td>@</td>

<td>vi eval</td>

<td>buffer name (a-z)</td>

</tr>

<tr>

<td>#</td>

<td>[UNBOUND](#defs)</td>

</tr>

<tr>

<td>$</td>

<td>move to end of line</td>

</tr>

<tr>

<td>%</td>

<td>match nearest [],(),{} on line, to its match (same line or others)</td>

</tr>

<tr>

<td>^</td>

<td>move to first non-whitespace character of line</td>

</tr>

<tr>

<td>&</td>

<td>repeat last ex substitution (":s ...") not including modifiers</td>

</tr>

<tr>

<td>*</td>

<td>[UNBOUND](#defs)</td>

</tr>

<tr>

<td>(</td>

<td>move to previous sentence</td>

</tr>

<tr>

<td>)</td>

<td>move to next sentence</td>

</tr>

<tr>

<td>\</td>

<td>[UNBOUND](#defs)</td>

</tr>

<tr>

<td>|</td>

<td>move to column zero</td>

</tr>

<tr>

<td>-</td>

<td>move to first non-whitespace of previous line</td>

</tr>

<tr>

<td>_</td>

<td>similar to "^" but uses numeric prefix oddly</td>

</tr>

<tr>

<td>=</td>

<td>[UNBOUND](#defs)</td>

</tr>

<tr>

<td>+</td>

<td>move to first non-whitespace of next line</td>

</tr>

<tr>

<td>[</td>

<td>move to previous "{...}" section</td>

<td>"["</td>

</tr>

<tr>

<td>]</td>

<td>move to next "{...}" section</td>

<td>"]"</td>

</tr>

<tr>

<td>{</td>

<td>move to previous blank-line separated section</td>

<td>"{"</td>

</tr>

<tr>

<td>}</td>

<td>move to next blank-line separated section</td>

<td>"}"</td>

</tr>

<tr>

<td>;</td>

<td>repeat last "f", "F", "t", or "T" command</td>

</tr>

<tr>

<td>'</td>

<td>move to marked line, first non-whitespace</td>

<td>character tag (a-z)</td>

</tr>

<tr>

<td>`</td>

<td>move to marked line, memorized column</td>

<td>character tag (a-z)</td>

</tr>

<tr>

<td>:</td>

<td>ex-submode</td>

<td>ex command</td>

</tr>

<tr>

<td>"</td>

<td>access numbered buffer; load or access lettered buffer</td>

<td>1-9,a-z</td>

</tr>

<tr>

<td>~</td>

<td>reverse case of current character and move cursor forward</td>

</tr>

<tr>

<td>,</td>

<td>reverse direction of last "f", "F", "t", or "T" command</td>

</tr>

<tr>

<td>.</td>

<td>repeat last text-changing command</td>

</tr>

<tr>

<td>/</td>

<td>search forward</td>

<td>search string, ESC or CR</td>

</tr>

<tr>

<td><</td>

<td>unindent command</td>

<td>[cursor motion command](#defs)</td>

</tr>

<tr>

<td>></td>

<td>indent command</td>

<td>[cursor motion command](#defs)</td>

</tr>

<tr>

<td>?</td>

<td>search backward</td>

<td>search string, ESC or CR</td>

</tr>

<tr>

<td>^A</td>

<td>[UNBOUND](#defs)</td>

</tr>

<tr>

<td>^B</td>

<td>back (up) one screen</td>

</tr>

<tr>

<td>^C</td>

<td>[UNBOUND](#defs)</td>

</tr>

<tr>

<td>^D</td>

<td>down half screen</td>

</tr>

<tr>

<td>^E</td>

<td>scroll text up (cursor doesn't move unless it has to)</td>

</tr>

<tr>

<td>^F</td>

<td>foreward (down) one screen</td>

</tr>

<tr>

<td>^G</td>

<td>show status</td>

</tr>

<tr>

<td>^H</td>

<td>backspace</td>

</tr>

<tr>

<td>^I</td>

<td>(TAB) [UNBOUND](#defs)</td>

</tr>

<tr>

<td>^J</td>

<td>line down</td>

</tr>

<tr>

<td>^K</td>

<td>[UNBOUND](#defs)</td>

</tr>

<tr>

<td>^L</td>

<td>refresh screen</td>

</tr>

<tr>

<td>^M</td>

<td>(CR) move to first non-whitespace of next line</td>

</tr>

<tr>

<td>^N</td>

<td>move down one line</td>

</tr>

<tr>

<td>^O</td>

<td>[UNBOUND](#defs)</td>

</tr>

<tr>

<td>^P</td>

<td>move up one line</td>

</tr>

<tr>

<td>^Q</td>

<td>XON</td>

</tr>

<tr>

<td>^R</td>

<td>does nothing (variants: redraw; multiple-redo)</td>

</tr>

<tr>

<td>^S</td>

<td>XOFF</td>

</tr>

<tr>

<td>^T</td>

<td>go to the file/code you were editing before the last tag jump</td>

</tr>

<tr>

<td>^U</td>

<td>up half screen</td>

</tr>

<tr>

<td>^V</td>

<td>[UNBOUND](#defs)</td>

</tr>

<tr>

<td>^W</td>

<td>[UNBOUND](#defs)</td>

</tr>

<tr>

<td>^X</td>

<td>[UNBOUND](#defs)</td>

</tr>

<tr>

<td>^Y</td>

<td>scroll text down (cursor doesn't move unless it has to)</td>

</tr>

<tr>

<td>^Z</td>

<td>suspend program</td>

</tr>

<tr>

<td>^[</td>

<td>(ESC) cancel started command; otherwise [UNBOUND](#defs)</td>

</tr>

<tr>

<td>^\</td>

<td>leave visual mode (go into "ex" mode)</td>

</tr>

<tr>

<td>^]</td>

<td>use word at cursor to lookup function in tags file, edit that file/code</td>

</tr>

<tr>

<td>^^</td>

<td>switch file buffers</td>

</tr>

<tr>

<td>^_</td>

<td>[UNBOUND](#defs)</td>

</tr>

<tr>

<td>^?</td>

<td>(DELETE) [UNBOUND](#defs)</td>

</tr>

</tbody>

</table>
