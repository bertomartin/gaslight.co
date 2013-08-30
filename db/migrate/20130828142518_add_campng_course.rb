class AddCampngCourse < ActiveRecord::Migration
  def up
    gaslight = TrainingApp::Venue.create!(name: 'Gaslight Training Room',
                                          address: '11126 Kenwood Rd Cincinnati OH 45242',
                                          city: 'Cincinnati, OH')

    campng = TrainingApp::Course.create!(title: 'CampNg',
                                         image_url: "http://ninja-squad.com/public/img/angularjs-logo.png",
                                         description_main: "Angular.js is a ridiculously productive way to build web applications. It's quick to learn and build things with, but it's also a powerful tool with some important concepts to learn. We're going to spend one crazily action packed day building an app in angular.js together. We'll start simple, and by the end of the day be hitting some of the more advanced features of this powerful framework. Go from zero to angular.js hero with us as we hit the following topics:

                                         Creating a new app quickly with yeoman

                                         Testing driving your app (unit and end-to-end)

                                         Controllers and scopes

                                         Using and writing filters

                                         Client side routing

                                         Forms and validation

                                         Organizing your code with modules

                                         Dependency injection with Services and Factories

                                         Using and writing directives

                                         Talking to the server with $http and friends")

    campng.workshops.create!(price: '150',
                             start_date: '2013-09-20',
                             end_date: '2013-09-20',
                             venue: gaslight)

  end

  def down
    TrainingApp::Workshop.destroy_all
    TrainingApp::Course.destroy_all
    TrainingApp::Venue.destroy_all
  end
end
