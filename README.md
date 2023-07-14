# Mood Opus

Mood Opus is a multimedia moodboard where you can upload audio and image files, or embeds Youtube and Bilibili,... links.

Mood Opus is a useful tool if you want:

- Collect media links based on favorite topics from multiple social media platform link Youtube, Bili, ...
- Create a media moodboard for your current mood and sharing with your friends.

## Screenshot
![Mood Opus Board](/screenshots/mood_opus_1.png)

![Mood Opus Upload](/screenshots/mood_opus_2.png) 

## Development

### Techstack 
- Ruby 3 + Rails 7
- Hotwire ( Turbo + Stimulus )
- Tailwindcss
- NodeJS + ESbuild
- Sqlite 3 (current) / Postgresql ( will change in future ) 
- libvips ( image processing library )

### Setup
Install Ruby and Javascript dependencies:
```
bundle install
yarn install
```
Database migration:
```
rails db:migrate
```
Start server:
```
./bin/dev
```
