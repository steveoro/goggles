module Version
  # [Steve, 20080414]
  # ** DO NOT CHANGE THE FOLLOWING UNLESS YOU KNOW WHAT YOU'RE DOING!! **
  CORE    = 'core-six'
  MAJOR   = '4.00'
  MINOR   = '72'
  BUILD   = '20131027 WIP'

  # Internal constant used to discriminate between all the existing and
  # running versions of the AgeX framework.
  FULL    = "#{MAJOR}.#{MINOR}.#{BUILD} (#{CORE})"

  # Current internal DB version (indipendent from migrations and framework release)
  DB      = "1.15.02"
end
