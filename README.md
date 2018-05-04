##ActionCable, MongoDB/Mongoid, Turbolinks5 and unobtrusive JavaScript Ruby 2.5.1,Rails 5.2

### Short demo
[user scroll video](https://www.dropbox.com/s/jeddjlqe82o0a0n/screencast_00025.mp4?dl=0)
#### Testing with cypress
[run tests video](https://www.dropbox.com/s/jv6t955svis4cjp/screencast_00026.mp4?dl=0)

1) Install MongoDB(e.g.ubuntu):
```
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl enable mongod
sudo systemctl start mongod
```
2) Clone repo
```
git clone git@github.com:migalenkom/user_scroll.git
cd user_scroll
```
3) Install libs
```
bundle install
npm install
```
4) Check config/mongoid.yml for correct credentials

5) Prepare DB
```
rake db:create
rake db:migrate
rake db:seed
```
6) run the server
```
rails s
```
7) run tests in separate console (rename cypress.json.example => cypress.json before run cypress)
```
./node_modules/cypress/bin/cypress open
rspec

```
