# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
TrainingApp::Workshop.destroy_all
TrainingApp::Course.destroy_all
TrainingApp::Venue.destroy_all

gaslight = TrainingApp::Venue.create!(name: 'Gaslight Training Room',
                                      address: '11126 Kenwood Rd Cincinnati OH 45242',
                                      city: 'Cincinnati, OH')

campng = TrainingApp::Course.create!(title: 'Learn Angular at CampNg',
                                     image_url: "http://ninja-squad.com/public/img/angularjs-logo.png",
                                     description_main: "Angular.js is a ridiculously productive way to build web applications. It's quick to learn and build things with, but it's also a powerful tool with some important concepts to learn. We're going to spend one crazily action packed day building an app in angular.js together. We'll start simple, and by the end of the day be hitting some of the more advanced features of this powerful framework. Go from zero to angular.js hero with us as we hit the following topics:

                                     Test driven angular (unit and end-to-end)

                                     Controllers and scopes

                                     Using and writing filters

                                     Client side routing

                                     Forms and validation

                                     Organizing your code with modules

                                     Dependency injection with Services and Factories

                                     Using and writing directives

                                     Talking to the server with $http and friends")

campng.workshops.create!(price: '199',
                         start_date: '2013-09-20',
                         end_date: '2013-09-20',
                         venue: gaslight)
