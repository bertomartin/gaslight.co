class AddCampngCourse < ActiveRecord::Migration
  def up
    gaslight = TrainingApp::Venue.create!(name: 'Gaslight Training Room',
                                          address: '11126 Kenwood Rd Cincinnati OH 45242',
                                          city: 'Cincinnati, OH')

    campng = TrainingApp::Course.create!(title: 'CampNg',
                                         image_url: "http://ninja-squad.com/public/img/angularjs-logo.png",
                                         description_main: "Do consequat voluptate, in pour-over kitsch 90's flannel High Life sapiente gluten-free cupidatat wayfarers sed. Commodo bicycle rights fap High Life, narwhal nostrud Odd Future cliche chia Terry Richardson tote bag aliquip. Shoreditch aliqua slow-carb photo booth elit eiusmod retro, nesciunt YOLO nulla you probably haven't heard of them DIY irure. Tote bag hella Etsy, skateboard +1 tempor cray organic. Polaroid Banksy nihil consequat, dreamcatcher dolor flexitarian bespoke aesthetic. Nisi meggings culpa paleo, fixie sustainable you probably haven't heard of them. 8-bit quis keytar messenger bag, Williamsburg cupidatat plaid bespoke selvage authentic do chillwave twee.

                                                            Officia enim delectus 90's, tofu Pitchfork 3 wolf moon Vice et lomo sed cillum. Aliquip assumenda letterpress ethnic Portland fanny pack cray in you probably haven't heard of them butcher. Food truck elit Marfa, vinyl accusamus art party stumptown whatever actually. Small batch anim accusamus, YOLO fanny pack brunch readymade est Pinterest wayfarers proident. Trust fund freegan pariatur, readymade direct trade enim asymmetrical locavore Terry Richardson do exercitation. Chillwave deep v four loko kale chips. Ennui mlkshk Pinterest slow-carb.

                                                            Skateboard Tumblr Intelligentsia, delectus YOLO trust fund Portland. Semiotics asymmetrical enim eiusmod. Nostrud organic ut, art party ad laboris sustainable pop-up aute seitan literally. Distillery fanny pack raw denim, Tumblr before they sold out single-origin coffee incididunt asymmetrical twee selfies master cleanse bespoke Truffaut. High Life commodo pork belly, synth est gluten-free Tumblr id fingerstache Austin food truck. Assumenda Neutra whatever, Bushwick dreamcatcher gentrify ea banh mi meh. Stumptown whatever ugh, Intelligentsia authentic asymmetrical sapiente.
 
                                                            Eu forage consectetur, wayfarers yr Intelligentsia bespoke accusamus. Leggings mollit banh mi, nihil roof party messenger bag fixie laboris Cosby sweater YOLO kogi. Farm-to-table mumblecore commodo messenger bag adipisicing. Ullamco iPhone nisi, viral sapiente artisan cillum Terry Richardson mustache. Distillery elit iPhone, chambray selvage cray aliqua small batch Godard whatever wolf irony aliquip. Polaroid ad nulla, in viral tofu irony direct trade skateboard culpa Wes Anderson sed. Blue Bottle hoodie incididunt, Pinterest flannel keffiyeh pork belly Godard.")

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
