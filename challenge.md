# Coding Challenge: Temporary Password Generator

## Objective:
Construct a program that generates a unique "temporary password" using the user's date of birth and email address.

## Task Guidelines:
1. Consider all inputs as valid.
2. For each digit in the birth year, month (whole month number), and date (whole date number), map it to the nearest "corresponding alphabet letter"*.

   \*"Corresponding alphabet letter" refers to numerical value that represent the letter of the alphabet, from 1 to 26. For instance, 1 maps to '', 2 to 'B', and so on until 26, which maps to 'Z'.

3. Use only the letters present in the inputted email address.
4. In case the corresponding alphabet letter is not found for a particular number, use the nearest available letter. If there are two equally close letters, choose the one that comes first in the alphabet.
5. If the digit is 0, replace it with '@'.
6. Ensure the output is in uppercase.
7. You are allowed to use any programming language.
8. You are not allowed to use any framework/library, except for unit testing purposes.
9. You are not allowed to use any external datetime modification package/library.
10. You can decide the method for inputting the date of birth (in YYYY-MM-DD format) and the email.
11. Write at least three unit tests with varying test cases to validate your solution.
12. Produce a simple guide detailing how to execute your program and its unit tests.
13. [Optional] Tackle the "Bonus Task" for bonus points.

## Bonus Task
1. If you end up using the nearest available letter due to the exact one not being present in the email, make that particular letter lowercase in the output.

## Examples

### Example 1:
```
# Input
email: ikhsan@jakpat.net
date of birth: 1980-07-15

# Output
AIH@HN

# Output (if "Bonus Task" is implemented)
AIH@hn

# Explanation

# Alphabet mapping of email
i => 9
k => 11
h => 8
s => 19
a => 1
n => 14
j => 10
a => 1
k => 11
p => 16
a => 1
t => 20
n => 14
e => 5
t => 20

# Conversion process (Year, convert each digit)
1980 => 1 => A
        9 => I
        8 => H
        0 => @

# Conversion process (Month, convert the whole number)
07 => 7 => G => H (As G is absent, H is chosen as the nearest letter)

# Conversion process (Date, convert the whole number)
15 => 15 => O => N/P => N (As O is absent, N is chosen as it comes before P)
```

### Example 2:
```
# Input
email: superadmin@jakpat.net
date of birth: 2001-10-31

# Output
A@@AJU

# Output (if "Bonus Task" is implemented)
a@@AJu
```
