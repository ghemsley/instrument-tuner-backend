# Instrument Tuner (Frontend)

The backend component of a customizable instrument tuner webapp

![Example image](https://github.com/ghemsley/instrument-tuner-frontend/raw/main/dist/assets/tune.png)

## Installation
To run the app, you will need [the frontend component of this project](https://github.com/ghemsley/instrument-tuner-frontend) as well. Refer to that repository's readme for instructions.

For the backend, first you will need Ruby 2.6.6 installed. A Ruby version manager like `rvm` is recommended. 

After Ruby is installed, clone this repo and run `bundle install` in the root project folder to install dependencies. 

Then run `rails db:migrate` and `rails db:seed` to setup the database and install some default instruments.

Finally, run `rails server` to launch the backend server. By default it will serve requests at `localhost:3000`.

Check the file `routes.rb` in the `config` folder to see the default api routes.

## Usage

The backend includes seed code for a Guitar and a Violin instrument already.
To tune one of those instruments, run the project then navigate to the instrument's page and hit the submit button on one of the included tunings.
You can also add tunings to those instruments if you want. Make sure that the notes include the corresponding octave and are comma separated.

For example, to add a standard 6 string guitar tuning, the form submission should have the string `E2, A2, D3, G3, B3, E4` in the `Tuning notes (comma separated)` field.

To add a new instrument, navigate to the `New instrument` page and give the instrument a name, then add one or more tunings and hit submit. An image will automatically be pulled from Unsplash for your instrument.

Afterwards, the page will refresh and you can navigate to the instrument page you just created using the navbar and hit submit on your preferred tuning to begin tuning your instrument.

When the tuner is activated, it will ask for permission to use an audio input device. Make sure you accept that request and choose an input device that has the least static and background noise. If the tuner doesn't seem to be working right, try to reduce background noise or increase the volume of your input device in your sound control panel.

The tuner will display the current tuning's notes in the lower left corner, as well as the current detected note.
When the current detected note matches one of the notes in your instrument's active tuning, it will be highlighted in green to let you know you are close to being in tune.

To further hone in on the correct pitch, watch the little bar at the bottom of the screen. When the current note is highlighted and the green marker is in the middle of the tuning bar, you should be in correct tune for that note.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ghemsley/instrument-tuner-backend

## License

[MIT License](./LICENSE)
