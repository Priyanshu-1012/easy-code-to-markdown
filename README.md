# easy-script-to-markdown
awk script to convert your script(python,perl,shell,awk...all languages that use # for comments) into markdown. Comments are converted to text and code to code-snippet in markdown. Save some precious time writing a README explaining the code.

Comments are converted to markdown text, the code is convereted to mrkdwn code-snippets.
| comment type | conversion(whole line)|
|--------------|------------|
| starts with # | normal |
| starts with ## | bold |
| starts with ### | italic |
| inline comment | ignored |

_(don't use space after # or ## or ###)._

### usage 
``` ❯ awk -f s2mkd.awk bash_script.sh > markdown_file.md ```

## Example
```bash
#!/bin/bash
##This is a simple Bash script example

#Define a variable
NAME="John"
echo "Welcome, $NAME!"

##Prompt the user for input
echo "Please enter your age:"
read AGE

###Check if the user is old enough
if [ "$AGE" -ge 18 ]; then
    echo "You are old enough to vote." #inline comment ignored
else
    echo "You are not old enough to vote."
fi

```

## Result in markdown

**This is an example bash script**

```bash
#!/bin/bash

```
Define a variable
```bash
NAME="John"
echo "Welcome, $NAME!"


```

**Prompt the user for input**

```bash

echo "Please enter your age:"
read AGE

```

*Check if the user is old enough*

```bash

if [ "$AGE" -ge 18 ]; then
    echo "You are old enough to vote." #inline comment ignored
else
    echo "You are not old enough to vote."
fi

```


## Installation

```shell
curl -o ~/s2mkd.awk https://raw.githubusercontent.com/Priyanshu-1012/easy-script-to-markdown/master/s2mkd.awk
```
