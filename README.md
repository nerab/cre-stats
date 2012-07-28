# CRE Stats

Provides simple statistics about [CRE](http://cre.fm/) and its guests.

[![Build Status](https://secure.travis-ci.org/nerab/cre-stats.png?branch=master)](http://travis-ci.org/nerab/cre-stats)

## Examples

![Graph](/nerab/cre-stats/raw/master/examples/episodes_by_year.png)

# Available Metrics

## Episodes
### Count
  * Total count of all episodes
  * As time series: episode count by
    - year
    - quarter
    - month
    - week
    - day

### Duration
  * Total duration of all episodes
  * As time series: average duration by
    - year
    - quarter
    - month
    - week
    - day

## Guests
### Count
  * Overall number of guests
    - with repeating guests
    - unique guests
  * With parameter: time series of guest count by
    - year
    - quarter
    - month
    - week
    - day
  * Number of guests by episode

Filtering is available on each parameter. In order to provide something like the

  Average duration of episodes by month between Jan 2010 to June 2011

the client would pass in this:

  TODO

## TODO
  - minimum
  - maximum
  - average

for the various metrics

## Combined Metrics

Integration of different metrics happens on the client. For instance, if a client wishes to present the number of episodes over years and the average duration of episodes over years, it woult fetch both metrics separately and construct presentations from it.

## Installation

Add this line to your application's Gemfile:

    gem 'cre-stats'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cre-stats

## Sample Script

Once the gem is installed, the `cre-stats` script will be in the user's path. Call it and it will print some simple statistics for [CRE](http://cre.fm/).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
