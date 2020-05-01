# Queue-a-text


## About

Want to queue a text? Try this.

### How it works

Two words: Heroku scheduler


## Features

- Rails
- Heroku
- Bootstrap

## How to use it

1. Clone
1. `bin/setup`
1. Add twilio credentials to `.env`

```bash
TWILIO_PHONE_NUMBER=****************
TWILIO_ACCOUNT_SID=****************
TWILIO_AUTH_TOKEN=****************
```

## Set up

### Requirements

- Ruby, Rails
- A Twilio account - [sign up](https://www.twilio.com/try-twilio)

### Twilio Account Settings

This application should give you a ready-made starting point for writing your
own appointment reminder application. Before we begin, we need to collect
all the config values we need to run the application:

| Config&nbsp;Value | Description                                                                                                                                                  |
| :---------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Account&nbsp;Sid  | Your primary Twilio account identifier - find this [in the Console](https://www.twilio.com/console).                                                         |
| Auth&nbsp;Token   | Used to authenticate - [just like the above, you'll find this here](https://www.twilio.com/console).                                                         |
| Phone&nbsp;number | A Twilio phone number in [E.164 format](https://en.wikipedia.org/wiki/E.164) - you can [get one here](https://www.twilio.com/console/phone-numbers/incoming) |

### Local development

After the above requirements have been met:

1. Clone this repository and `cd` into it

2. Run the application

```bash
bin/setup && rails server
```

3. Navigate to [http://localhost:3000](http://localhost:3000)

That's it!

## License

[MIT](http://www.opensource.org/licenses/mit-license.html)

## Disclaimer

No warranty expressed or implied. Software is as is.

[twilio]: https://www.twilio.com
