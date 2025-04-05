1. Do not alter n = arr.length with -1

# String Notes
### ASCII - American Standard Code for Information Interchange
Table

| ASCII Code | Character | Description |
|------------|-----------|-------------|
| 0-31       |           | Control characters (non-printable) |
| 32         | (space)   | Space |
| 33         | !         | Exclamation mark |
| 34         | "         | Double quote |
| 35         | #         | Hash |
| 36         | $         | Dollar sign |
| 37         | %         | Percent |
| 38         | &         | Ampersand |
| 39         | '         | Single quote |
| 40         | (         | Left parenthesis |
| 41         | )         | Right parenthesis |
| 42         | *         | Asterisk |
| 43         | +         | Plus |
| 44         | ,         | Comma |
| 45         | -         | Hyphen |
| 46         | .         | Period |
| 47         | /         | Forward slash |
| 48-57      | 0-9       | Numbers 0-9 |
| 58         | :         | Colon |
| 59         | ;         | Semicolon |
| 60         | <         | Less than |
| 61         | =         | Equals |
| 62         | >         | Greater than |
| 63         | ?         | Question mark |
| 64         | @         | At symbol |
| 65-90      | A-Z       | Uppercase letters A-Z |
| 91         | [         | Left square bracket |
| 92         | \         | Backslash |
| 93         | ]         | Right square bracket |
| 94         | ^         | Caret |
| 95         | _         | Underscore |
| 96         | `         | Backtick |
| 97-122     | a-z       | Lowercase letters a-z |
| 123        | {         | Left curly brace |
| 124        | \|        | Vertical bar |
| 125        | }         | Right curly brace |
| 126        | ~         | Tilde |
| 127        |           | Delete (control character) |

Key points about ASCII:
1. Total of 128 characters (0-127)
2. First 32 characters (0-31) are control characters
3. 32-126 are printable characters
4. 127 is the DEL (delete) control character
5. ASCII is a 7-bit character encoding
6. Extended ASCII uses 8 bits (0-255) but is not part of the standard ASCII table

### Unicode
Almost half a million symbols of all kinds, including arrows, mathematical signs, emojis, hieroglyphics, and ancient scripts, are available.

1. Supports other languages
2. Supports Emojies

| Unicode Code | Character | Description |
|-------------|----------|-------------|
| U+0041      | A        | Uppercase A |
| U+0042      | B        | Uppercase B |
| U+0043      | C        | Uppercase C |
| U+0044      | D        | Uppercase D |
| U+0045      | E        | Uppercase E |
| U+0046      | F        | Uppercase F |
| U+0047      | G        | Uppercase G |
| U+0048      | H        | Uppercase H |
| U+0049      | I        | Uppercase I |
| U+004A      | J        | Uppercase J |
| U+004B      | K        | Uppercase K |
| U+004C      | L        | Uppercase L |
| U+004D      | M        | Uppercase M |
| U+004E      | N        | Uppercase N |
| U+004F      | O        | Uppercase O |
| U+0050      | P        | Uppercase P |
| U+0051      | Q        | Uppercase Q |
| U+0052      | R        | Uppercase R |
| U+0053      | S        | Uppercase S |
| U+0054      | T        | Uppercase T |
| U+0055      | U        | Uppercase U |
| U+0056      | V        | Uppercase V |
| U+0057      | W        | Uppercase W |
| U+0058      | X        | Uppercase X |
| U+0059      | Y        | Uppercase Y |
| U+005A      | Z        | Uppercase Z |
| U+0061      | a        | Lowercase a |
| U+0062      | b        | Lowercase b |
| U+0063      | c        | Lowercase c |
| U+0064      | d        | Lowercase d |
| U+0065      | e        | Lowercase e |
| U+0066      | f        | Lowercase f |
| U+0067      | g        | Lowercase g |
| U+0068      | h        | Lowercase h |
| U+0069      | i        | Lowercase i |
| U+006A      | j        | Lowercase j |
| U+006B      | k        | Lowercase k |
| U+006C      | l        | Lowercase l |
| U+006D      | m        | Lowercase m |
| U+006E      | n        | Lowercase n |
| U+006F      | o        | Lowercase o |
| U+0070      | p        | Lowercase p |
| U+0071      | q        | Lowercase q |
| U+0072      | r        | Lowercase r |
| U+0073      | s        | Lowercase s |
| U+0074      | t        | Lowercase t |
| U+0075      | u        | Lowercase u |
| U+0076      | v        | Lowercase v |
| U+0077      | w        | Lowercase w |
| U+0078      | x        | Lowercase x |
| U+0079      | y        | Lowercase y |
| U+007A      | z        | Lowercase z |


### UTF-8
# Unicode Transformation Format – 8-bit. Almost every webpage is stored in UTF-8.
| Decimal Code | Character | Description |
|-------------|----------|-------------|
| 65       | A        | Uppercase A |
| 66       | B        | Uppercase B |
| 67       | C        | Uppercase C |
| 68       | D        | Uppercase D |
| 69       | E        | Uppercase E |
| 70       | F        | Uppercase F |
| 71       | G        | Uppercase G |
| 72       | H        | Uppercase H |
| 73       | I        | Uppercase I |
| 74       | J        | Uppercase J |
| 75       | K        | Uppercase K |
| 76       | L        | Uppercase L |
| 77       | M        | Uppercase M |
| 78       | N        | Uppercase N |
| 79       | O        | Uppercase O |
| 80       | P        | Uppercase P |
| 81       | Q        | Uppercase Q |
| 82       | R        | Uppercase R |
| 83       | S        | Uppercase S |
| 84       | T        | Uppercase T |
| 85       | U        | Uppercase U |
| 86       | V        | Uppercase V |
| 87       | W        | Uppercase W |
| 88       | X        | Uppercase X |
| 89       | Y        | Uppercase Y |
| 90       | Z        | Uppercase Z |
| 97       | a        | Lowercase a |
| 98       | b        | Lowercase b |
| 99       | c        | Lowercase c |
| 100      | d        | Lowercase d |
| 101      | e        | Lowercase e |
| 102      | f        | Lowercase f |
| 103      | g        | Lowercase g |
| 104      | h        | Lowercase h |
| 105      | i        | Lowercase i |
| 106      | j        | Lowercase j |
| 107      | k        | Lowercase k |
| 108      | l        | Lowercase l |
| 109      | m        | Lowercase m |
| 110      | n        | Lowercase n |
| 111      | o        | Lowercase o |
| 112      | p        | Lowercase p |
| 113      | q        | Lowercase q |
| 114      | r        | Lowercase r |
| 115      | s        | Lowercase s |
| 116      | t        | Lowercase t |
| 117      | u        | Lowercase u |
| 118      | v        | Lowercase v |
| 119      | w        | Lowercase w |
| 120      | x        | Lowercase x |
| 121      | y        | Lowercase y |
| 122      | z        | Lowercase z |

### UTF-16
