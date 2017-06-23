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

## GIT

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

## Controller Generator

Vado a creare un nuovo branch con:

git branch -b controller-generator

e verifico con:

git branch

Quando utilizzo lo scaffold, questo mi crea di tutto, dalla view al model al controller. La "pecca" è che a volte mi crea anche troppo ;)

il nome del controller è espresso per convenzione al plurale.

rails g controller Pages home about contact

Ho avuto un pò di problemi, ho disinstallato rbenv che avevo precedentemente con brew e fatto gem install bundler e gem install rails e bundle install e poi lanciato il generator.
Ho avviato il server con:

rails s

http://localhost:3000/pages/home

Se vado a vedere le views sotto app, noterò che i files generati dallo scaffold sono molti di èiù dei 3 files creati dal controller, mentre in blogs ho la form, la edit, ecc..
Anche il controller creato con il generator dei controller è completamente diverso dal controller generato dallo scaffold.
Inoltre in routes.rb ho la mappatura delle RICHIESTE GET (con relative URL) con le view relative e con le action del controller (il nome è importante!!!)
Quando ho una richiesta GET su pages/home mi si avvia la action home del controller pages ;)
Ad esempio in home (action) potrei avere:

@posts = Blog.all

ovvero creo una variabile di istanza posts e accedo al metodo all di Blog che è il mio modello (presente in app/models/blog.rb)

e nella view home.html.erb posso inserire:

<%= @posts.inspect %>

Ho fatto il git add . e il git commit -m e il git push origin controller-generator e sulla pagina git il merge di questo branch con il master e infine in locale il git checkout master e il git pull.

## Model Generator

Creiamo il nuovo branch:

git checkout -b model-generator

Il nome del modello è espresso per convenzione al singolare.
rails g model Skill title:string percent_utilized:integer

Potevo mettere decimal anzichè integer come tipo di dato per la percentuale, ma non scenderò a questo livello di dettaglio.
Passiamo gli attributi del modello con il tipo del dato che conterrà.

Il comando invoca ACTIVE RECORD, che crea 2 file: un migration file un un file per il modello che sarà una classe Skill che avrà una connessione diretta al database. Il file di migrazione sarà una classe che eredita da ActiveRecord::Migration. Rails inserisce sempre due attributi di timestamps (created_at e updated_at).

Ora cambiamo effettivamente il database:

rails db:migrate

## Rails Console

Per lanciare la Rails Console faccio:

rails c

Creiamo una nuova skill:

Skill.create!(title: "Rails", percent_utilized: 75)

Il punto esclamativo è detto BING, se succede qualcosa lancia un messaggio di errore (throw an error), ad esempio se scrivessi male il nome dell'attributo. Senza il BING il fail sarà silenzioso.

In questo modo ho creato un nuovo record.

Ricordi come faccio a prendere tutti i blog dal controller di Post? @Blog.all, bene ora posso fare:

Skill.all

per avere tutte le skill nel db.

Nella view andiamo ad inserire:

<h1>Skills</h1>
<%= @skills.inspect %>

Ovviamente nel controller avrò @skills = Skill.all

L'inspect ci darà tutte le informazioni relative al Record. Anche la Classe di appartenenza.

Come possiamo vedere, posso accedere dal controller di Posts anche al modello Blog.

Facciamo il commit su git.