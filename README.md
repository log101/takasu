# Takasu
### Manga Trading Platform

- You can create your own manga library
- You can search for other people's mangas (powered by *Algolia Search*)
- You can send trade requests to other users

### Stack

- Ruby on Rails
- React

### How to Run
* Clone the repository
* `cd takasu`
* `docker-compose up -d`
* Run the migrations with `rails db:migrate`
* For email password recovery:
  - set the environment variable `SENDMAIL_USERNAME` and `SENDMAIL_PASSWORD` with your google mail accound and password
* Access the app at localhost:3000 (only gmail is supported)
