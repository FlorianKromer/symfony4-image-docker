# symfony4-image-docker

Contient
  - git 
  - pdo pdo_mysql intl
  - composer
  
 example de bitbucket-pipelines.yml
  ```yml
# This is a sample build configuration for PHP.
# Check our guides at https://confluence.atlassian.com/x/e8YWN for more examples.
# Only use spaces to indent your .yml configuration.
# -----
# You can specify a custom docker image from Docker Hub as your build environment.
image: flouch/symfony4-image-docker 
pipelines:
  branches:
    production:
      - step:
          name: Deploy
          caches:
            - composer
          script:
            - composer install
            - php bin/console doctrine:schema:update --force
            - php bin/console doctrine:fixtures:load -n
            - vendor/bin/phpunit 
            - git config --global user.email "toto@titi.net"
            - git config --global user.name "toto"
            - git pull https://heroku:$HEROKU_API_KEY@git.heroku.com/$HEROKU_APP_NAME.git master
            - git push https://heroku:$HEROKU_API_KEY@git.heroku.com/$HEROKU_APP_NAME.git HEAD:master -f

          services: 
            - mysql
    master:
      - step:
          name: Deploy
          caches:
            - composer
            - bundle
          script:
            - composer install
            - php bin/console doctrine:schema:update --force
            - php bin/console doctrine:fixtures:load -n
            - vendor/bin/phpunit

          services: 
            - mysql            
definitions: 
  services: 
    mysql: 
      image: mysql 
      environment: 
        MYSQL_DATABASE: 'azerty'
        MYSQL_ROOT_PASSWORD: '123456'
  caches:
    bundle: vendor
    
```
