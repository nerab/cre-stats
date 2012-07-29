# CRE Stats

Provides simple statistics about [CRE](http://cre.fm/) and its guests.

[![Build Status](https://secure.travis-ci.org/nerab/cre-stats.png?branch=master)](http://travis-ci.org/nerab/cre-stats)

# Examples

![Graph](/nerab/cre-stats/raw/master/examples/episodes_by_year.png)

# Available Metrics

## Podcast
  * All: `/`
    - Total count of all episodes
    - Total duration of all episodes
    - The episodes themselves without associates
    - Total count of all guests (with repeating, optionally unique)

## Episodes
  * All: `/episodes`
    - Total count of all episodes
    - Total duration of all episodes
    - The episodes themselves without associates
  * One: `/episodes/cre193`
    - Total count will be one
    - Total duration will be equal to duration of that one
    - Count of guests in that episode
    - The episode itself without associates
  * Grouped: `/episodes/by-year`
    - By year, quarter, month, week, or day
    - Within each group, includes
      * Total count of all episodes in group
      * Total duration of all episodes in group
      * Total count of guests in that group
      * The episodes themselves without associates

## Guests
  * All: `/guests`
    - Total count of all guests (with repeating, optionally unique)
    - Total duration of all episodes any guest participated in
    - The guests themselves without associates
  * One: `/guests/Martin%20Haase`
    - Total count of episodes that guest participated in
    - Total duration of all episodes that guest participated in
    - The guest himself without associates
  * Grouped by `/guests/by-quarter`
    - By year, quarter, month, week, or day
    - Within each group, includes
      * Total count of all episodes
      * Total duration of all episodes a guest participated in
      * The guests themselves without associates

## Filtering
In order to query for the average duration of episodes by month between Jan 2010 to June 2011, a client would specify a by-x resource and specify constraints as query parameters, either

* as list:

    /episodes/by-year?year=2005&year=2006&year=2007

* or as range:

    /guests/by-month?from=200501&to=201106

## TODO

  - Minima
  - Maxima
  - Averages
    * Average number of guests by episode
  - Ordering
  - Limits

for the various metrics

# Combined Metrics

Integration of different metrics happens on the client. For instance, if a client wishes to present the number of episodes over years and the average duration of episodes over years, it woult fetch both metrics separately and construct presentations from it.

# Installation

Add this line to your application's Gemfile:

    gem 'cre-stats'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cre-stats

## Sample Script

Once the gem is installed, the `cre-stats` script will be in the user's path. Call it and it will print a JSON that describes the available resources.

Resources can be addressed by passing an URL parameter. For instance, calling

    $ cre-stats /episodes

will print a JSON representation of all CRE episodes known to this service.

Likewise, the following call prints a JSON string with details for [CRE191](http://cre.fm/cre191):

    $ cre-stats /episodes/cre191

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
