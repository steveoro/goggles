module Version
  # [Steve, 20080414]
  # ** DO NOT CHANGE THE FOLLOWING UNLESS YOU KNOW WHAT YOU'RE DOING!! **
  CORE    = 'core-six'
  MAJOR   = '4.00'
  MINOR   = '104'
  BUILD   = '20131125'

  # Internal constant used to discriminate between all the existing and
  # running versions of the AgeX framework.
  FULL    = "#{MAJOR}.#{MINOR}.#{BUILD} (#{CORE})"

  # Compact version of the versioning costant.
  COMPACT = "#{MAJOR.gsub('.','')}#{MINOR}"

  # Current internal DB version (indipendent from migrations and framework release)
  DB      = "1.15.07"
end
