## Goggles  -o^o-
### Swimming Results Browser & "Swimming Life-style" enhancer

[![Maintainability](https://api.codeclimate.com/v1/badges/d04a16c56341b1ce59a3/maintainability)](https://codeclimate.com/github/steveoro/goggles/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/d04a16c56341b1ce59a3/test_coverage)](https://codeclimate.com/github/steveoro/goggles/test_coverage)
[![CodeFactor](https://www.codefactor.io/repository/github/steveoro/goggles/badge)](https://www.codefactor.io/repository/github/steveoro/goggles)
[![Build Status](https://semaphoreci.com/api/v1/steveoro/goggles/branches/master/badge.svg)](https://semaphoreci.com/steveoro/goggles)


Goggles is a Rails application developed to manage and browse the results obtained
dynamically from any official Swimming competition. The app is designed also to handle
a lot more, as long as is related to Swimming.

It features some crude internal social features for handling and sharing reviews of
swimming-pools and sporting venues, manage trainings, lessons, meeting reservations,
custom internal championship cups and a lot more.

Although open for browsing to the general public, the official site (master-goggles.org)
is still used in closed beta and reserved as the Official Championship result publisher for
only a few selected Swimming Teams from a Regional Championship in the north of Italy.

The administration/data-import sub-app resides in a dedicated project (goggles_admin) and is
typically deployed and used only locally, firewalled by a LAN.

The GogglesAdmin app features a complex, mostly automated, data-import process with
a custom Parser. This is able to parse several results and starting-list file formats,
typically generated from various sources all over the net (mostly, Swimming Federations sites).
This allows recurrent jobs and crawlers to automatically update the underlying database
with all the supported data files.


Official framework Wiki, [here](https://github.com/steveoro/goggles_admin/wiki)
