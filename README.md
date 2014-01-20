# Civil Claims Spec

Local installation
------------------

### Clone repo and install gems

    git clone https://github.com/ministryofjustice/civil-claims-spec.git

    cd civil-claims-spec
    bundle install

### Run tests

Run devise_authentication_api

    cd ../devise_authentication_api
    bundle exec rackup -p 9393

Run backend API

    cd ../civil-claims-backend-data-api
    bundle exec rails s -p 3111

Run frontend

    cd ../civil-claims-frontend-claimant
    bundle exec rails s

Run specs

    cd ../civil-claims-spec
    rake

