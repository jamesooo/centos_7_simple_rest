include class { 'weather::gunicorn': 
    env => {
        gunicorn => {
            weather => {
                api_key => 'd7152267a0b7b28c456fe856d793be5d',
                latitude => '45.5155',
                longitude => '-122.6793'
            }
        }
    }
}

