![logo(2)](https://user-images.githubusercontent.com/50502021/177497085-d4acf1a3-952f-4537-a1a4-32ffab2e2ce3.png)
---
### Takasu Manga Trading Platform

- You can create your own manga library
- You can search for other people's mangas (powered by **Algolia Search**)
- You can send trade requests to other users

### How to Run
* Clone the repository
* `cd takasu`
* `yarn install`
* `docker-compose up -d`
* Create the database with `docker-compose exec web rails db:create`
* Run the migrations with `docker-compose exec web rails db:migrate`
* For email password recovery:
  - set the environment variable `SENDMAIL_USERNAME` and `SENDMAIL_PASSWORD` with your google mail account and password (only gmail is supported)
* Access the app at localhost:3000

### Stack
![takasu_github_image](https://user-images.githubusercontent.com/50502021/177503462-7c89f209-9474-457f-ad40-e75a3b15f68f.png)
