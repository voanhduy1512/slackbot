# README


Slackbot callback url

`http://slackbot.anhduy.io/callback/[:service]?room=:room&botname=:botname&is_channel=:is_channel&is_person=:is_person`

### Options explain

* `service` --  `gitlab` or `heroku`
* `room` --  channel, person, private room ... name without @ or #
* `botname` -- this is your bot name, call it whatever you want
* `is_channel` -- *optional*, if `room` is a channel, make it true; otherwise, don't pass it in url
* `is_person` -- *optional*, if `room` is a person, make it true; otherwise, don't pass it in url

## Gitlab

First go to your gitlab project setting page -> Web Hooks

Input the url like above guide

##### Example:

`http://slackbot.anhduy.io/callback/gitlab?room=saigon&botname=gitlab&is_channel=:is_channel` => gitlab commit will post to channel `saigon`

`http://slackbot.anhduy.io/callback/gitlab?room=taxisg&botname=gitlab` => gitlab commit will post to private group `taxisg`


## Heroku

```bash
heroku addons:add deployhooks:http --url=[:url]
```

##### Example:

Post heroku deploy to channel
```bash
heroku addons:add deployhooks:http --url=http://slackbot.anhduy.io/callback/heroku?room=saigon&botname=gitlab&is_channel=true
```

Post heroku deploy to private group
```bash
heroku addons:add deployhooks:http --url=http://slackbot.anhduy.io/callback/heroku?room=taxisg&botname=gitlab
```
