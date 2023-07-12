#!/usr/bin/awk -f

BEGIN {
    inCodeBlock = 0
    codeBlockStart = "```bash"
    codeBlockEnd = "```"
    shebang = ""
}

function printFormattedComment(comment) {
    if (substr(comment, 1, 4) == "####") {
        comment = sprintf("_%s_", substr(comment, 5))
    } else if (substr(comment, 1, 3) == "###") {
        comment = sprintf("*%s*", substr(comment, 4))
    } else if (substr(comment, 1, 2) == "##") {
        comment = sprintf("**%s**", substr(comment, 3))

    } else {
        comment = substr(comment, 2)
    }
    print comment
}

{
    if ($0 ~ /^#!/) {
        shebang = $0
    } else if ($0 ~ /^#/) {
        if (inCodeBlock) {
            print codeBlockEnd
            inCodeBlock = 0
        }
        if (substr($0, 1, 2) == "##" || substr($0, 1, 3) == "###" || substr($0, 1, 4) == "####") {
            print commentBlockStart
            printFormattedComment($0)
            print commentBlockEnd
        } else {
            printFormattedComment($0)
        }
    } else {
        if (!inCodeBlock) {
            if (shebang != "") {
                print codeBlockStart
                print shebang
                shebang = ""
            } else {
                print codeBlockStart
            }
            inCodeBlock = 1
        }
        print $0
    }
}

END {
    if (inCodeBlock) {
        print codeBlockEnd
    }
}

