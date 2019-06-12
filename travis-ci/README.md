NOTE: make sure you're set up at:https://travis-ci.com

`docker-compose up`

`travis login --pro`

enter github credentials

move `service-account.json` into folder

run `travis encrypt-file service-account.json`

`docker-compose down`

OR



`docker run -it -v ${pwd}:/app ruby:2.3 sh`
`gem install travis --no-rdoc --no-ri`
`gem install travis`
`travis login --org`
(put service-account in directory)
`travis encrypt-file service-account.json -r [name of repo want to tie to]`
Copy output command into .travis.yml and put in before_install
Move `service-account.json.enc` into directory with `.travis.yml`