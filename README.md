# README

#Per installare HOMEBREW, GNU Privacy Guard e RVM:

Homebrew è un gestore di packages:

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install gpg

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

\curl -sSL https://get.rvm.io | bash -s stable --ruby

rvm -v

rvm list

rvm use ruby-2.4.0

in caso ottenessi questo errore:
"rvm installation not working: “RVM is not a function” "

lancio:
source ~/.rvm/scripts/rvm

type rvm | head -n 1

# RAILS Comandi lanciati:

rails -h per aver l'help
rails new DevacampPortfolio -T --database=postgresql

di default rails avvia il bundle install per installare le varie gemme. Per non farlo devo specificare l'opzione -B

rails s 
(connettiti a http://localhost:3000 e avrò un errore che risolvo con il comando succ)
rails db:create
rails db:migrate

Posso avviare anche con
rails db:create && rails db:migrate

rails g scaffold Blog title:string body:text
rails db:migrate
aggiornerà il file in db/migrate/schema.rb che non dovrò mai editare direttamente, è la foto del mio db
rails s
(connettiti a http://localhost:3000/blogs)
rake routes (per vedere le routes disponibili)

Le routes sono passate rispetto alle actions del controller.

Ricorda che le actions (metodi) del controller sono legati alle view con il nome, quindi il nome è molto importante altrimenti avrei un errore di missing template.

Con rails -h vedo tutte le opzioni che posso passare a rails:

rails new APP_PATH [options]

APP_PATH specifica la path del mio progetto, in un posto differente rispetto a dove lancio il comando rails:

rails new mypath/myproj

Con il comando --database=mysql (oracle/postgresql/sqlite3/sqlserver/...) specifico il database.
Con il comando --javascript posso specificare una libreria Javascript (jQuery di default oppure altre librerie come Angular)
Con il comando --skip-keeps non inserisco il file .keep nelle cartelle inzialmente vuote che altrimenti verrebbero ignorate da GIT.
Posso specificare le versione edge o dev di rails, che di default userà la stable.

Se volessi avere solo un backend API senza avere l'autogenerazione delle view del fronted mi basta lanciare:

rails new my_api --api -T
rails db:create && rails db:migrate
rails g scaffold Post title:string body:text
rails db:migrate

Nota che non avrò nessuna view in app/views, avrò solo il layout per il mailer. Inoltre nel controller posso notare che il render nelle actions è di tipo "json" questo perchè sto applicando un architettura REST. Questa opzione è importante soprattutto in chiave d'uso con Angular o REACT.

La magia dietro allo scaffolding è in lib/rails/generators/app_base.rb

# GIT

ho creato la mia public SSH KEY e creato in Lawen78 il repository e nella root ho fatto:

git init
git status
git add . (oppure git add --all)
git status

avevo fuori ancora README.md:

git add README.md
git commit -m 'Initial commit'
git status
git log

Per pulire la cache di git:

git rm . -r --cached