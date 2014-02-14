# README

## Create Webhook in Gitlab

First go to your gitlab project setting page -> Web Hooks

Input the url like:

`http://slackbot.anhduy.io/callback/gitlab?room=:room&botname=:botname&is_channel=:is_channel&is_person=:is_person`

### Options explain


* `room` --  channel, person, private room ... name without @ or #
* `botname` -- this is your bot name, call it whatever you want
* `is_channel` -- *optional*, if `room` is a channel, make it true; otherwise, don't pass it in url
* `is_person` -- *optional*, if `room` is a person, make it true; otherwise, don't pass it in url