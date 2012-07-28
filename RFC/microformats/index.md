# Podcast Microformats

This document proposes how to use microformats on a website for tagging podcast attributes.

title

subtitle

author

link
  * self
  * enclosure
    - url="http://example.com/podcasts/everything/AllAboutEverythingEpisode2.mp3"
    - length="5650889"
    - type="audio/mpeg"

pubDate

image

duration

## Guests

If there are guests on the podcast, their name can be tagged with `guest`. If at least one `guest` is present, the names of the guests should appear in a list which should be enclosed by a container that is tagged with `guests`.

Example:

    <ul class="guests">
      <li class="guest">Peter Hecko</li>
      <li class="guest">Florian Grunow</li>
    </ul>

Alternative example:

    <span class="guests">
      <b class="guest">Peter Hecko</b>, <b class="guest">Florian Grunow</b>
    </ul>
