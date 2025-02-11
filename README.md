# Mood Opus

Mood Opus is a multimedia moodboard where you can upload audio and image files, or embeds Youtube and Bilibili,... links.

Mood Opus is a useful tool if you want:

- Collect media links based on favorite topics from multiple social media platform link Youtube, Bili, ...
- Create a media moodboard for your current mood and sharing with your friends.

## Development

### Techstack 
- Ruby 3 + Rails 7
- Hotwire ( Turbo + Stimulus )
- Tailwindcss
- NodeJS + ESbuild
- Postgresql 
- libvips ( image processing library )

### Setup
Install Ruby and Javascript dependencies:
```
bundle install
yarn install
```
Create and migration database: 
```
rails db:create
rails db:migrate
```
Start server:
```
./bin/dev
```

### Docker
```
docker-compose build

docker-compose run --rm web bin/rails db:create  
docker-compose run --rm web bin/rails db:migrate  
docker-compose run --rm web bin/rails db:seed  

docker-compose up 
```
