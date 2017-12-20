require 'json'
require_relative 'features/support/api_helper.rb'
thubmnail = {'url' => 'https://cdn8.littlethings.com/app/uploads/2017/10/Screen-Shot-2017-10-31-at-4.40.01-PM-850x548.jpg'}

build_number = ARGV[0]

job_url = ARGV[1]

fields =[]
fields.push({'name' => 'jenkins job', 'value' => job_url})
fields.push({'name' => 'Buld number', 'value' => build_number.to_s})

embed = []
embed.push({'color' => 15665108,
            'fields' => fields,
           'thumbnail' => thubmnail})
payload = {'content' => 'Automatic message',
          'embeds' => embed}.to_json

post("https://discordapp.com/api/webhooks/393067525451022336/uz2WgUi_8-6oS9zy2Pu_3l_-CtQvabdSlgflF_ojyxTxWgxO_8Vdj0qBDMNixDj6wlT1",
     headers: {'Content-Type' => 'application/json'},
     cookies: {},
     payload: payload)