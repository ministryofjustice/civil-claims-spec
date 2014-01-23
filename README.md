# Civil Claims Spec

JS enabled: [![Build Status](http://jenkins-ubuntu.dsd.io/job/civilclaims-spec-js/badge/icon)](http://jenkins-ubuntu.dsd.io/job/civilclaims-spec-js/)
JS disabled: [![Build Status](http://jenkins-ubuntu.dsd.io/job/civilclaims-spec-no-js/badge/icon)](http://jenkins-ubuntu.dsd.io/job/civilclaims-spec-no-js/)

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

Run all the specs with selenium

    rake browser=selenium

or run an individual feature with (see the advanced section below for details):

    cucumber features/01_Start_a_case/01_Personal_details.feature --wip browser=selenium

#### Advanced Usage:

Command line help:

```shell
$ rake help

Runs cucumber features.

Usage:
rake [profile] [tag=tag_name]
Show the set of defined tag names using the 'list_tags' profile
```

Predefined cucumber profiles:

There are a small number of [cucumber profiles](.config/cucumber.yml) set up which automate some common scenarios.  Of note is `demo` mode, which uses the selenium browser & adds a pause to the end of each step definition. This is configured to test against the demo environment, for which the url is defined in [support/config/environments.yml](support/config/environments.yml)

Additionally there is a `kamizake` profile which runs every available scenario, even the scenarios tagged @wip or @no-automation

Finally, the list_tags profile dumps a crude list of all known tags to the console. This is a proof-of-concept that may one day evolve into a test automation progress-o-meter.
