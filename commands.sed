# put occupant in hold buffer
/\\jhoccupant/{
  h
}

# add \jhname to \jhperson
:fix-jhperson
/\\jhperson\{[[:alpha:]]/{
  G
  s/(.*\\jhperson\{)([[:alpha:] -]*)(\}.*)\n\\jhoccupant\{([^\}]*)\}.*/\1\\jhname[\2]\{\4, \2\}\3/
  t fix-jhperson
}

# add \jhname to \jhperson
s/(\\jhperson\{\\jhbold\{)([[:alpha:] -]*)(\}\})/\1\\jhname[\2]\{\2\}\3/g

# allow line breaks between numbers in a date
s/([0-3][0-9])\.([0-2][0-9])\.([0-9]{1,4})/\1.\\allowbreak\{\}\2.\\allowbreak\{\}\3/g

# allow line break in hyphenated names or year combos
/\\jh(house)?pic/!{
  s/([[:alpha:]]{2,}|[[:digit:]]{2,4})-([[:alpha:]]{2,})/\1-\\allowbreak\{\}\2/g
}

# remove allowbreak from second jhname arg
:fix-jhname
s/(\\jhname(\[.*\])?\{.*)\\allowbreak\{\}(.*\})/\1\3/
t fix-jhname
