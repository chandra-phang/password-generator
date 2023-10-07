# Coding Challenge: Temporary Password Generator

## Objective:
Create a program that generates a unique "temporary password" using the user's date of birth and email address.

## Task Guidelines:
1. Consider all inputs as valid.
2. Map each digit in the birth year, month (whole month number), and date (whole date number) to the nearest corresponding alphabet letter.
3. Use only the letters present in the inputted email address.
4. If a corresponding alphabet letter is not found, use the nearest available letter. If two letters are equally close, choose the one that comes first in the alphabet.
5. If the digit is 0, replace it with '@'.
6. Ensure the output is in uppercase.
7. If using the nearest available letter due to the exact one not being present in the email, make that particular letter lowercase in the output.

## Examples

### Example 1:
```plaintext
# Input
email: ikhsan@jakpat.net
date of birth: 1980-07-15

# Output
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
```plaintext
# Input
email: superadmin@jakpat.net
date of birth: 2001-10-31

# Output
a@@AJu
```

### Check your Ruby version

```shell
ruby -v
```

The output should start with something like `ruby 3.1.2`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv):

```shell
rbenv install 3.1.2
```

## Running the Application
```shell
ruby app.rb
```

## Running Tests
```shell
ruby password_generator_test.rb
```
