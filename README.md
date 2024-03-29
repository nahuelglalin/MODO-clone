# MODO Clone

## Introduction 

Part of the MODO App was developed, including its screens and login logic, DNI (National Identification Document) entry, phone, and password. Additionally, the Home, Promotions, Wallet, and Profile screens were created

Before proceeding with the document, I recommend watching the Demo video, as I discuss and showcase the implemented flows there.

## Code & Demo

In [this link](https://drive.google.com/file/d/1S9Jh5JetOUAyyLDW0MXBXjkzxBYeu8pS/view), you can watch a demo video of the project.

## Architecture

An MVP-R architecture was used.

The screens consist of the View (XIB + ViewController), responsible for displaying and accepting user interactions.

The logic is handled in the Presenter, which holds the data and instructs the View on what to display and what not to.

The model contains the "interfaces", with the decodables needed to parse the data received in JSON format.

Finally, the Router is responsible for screen navigation.

## Libraries Used

`Lottie` For animations.

`SwiftSVG` For loading images in SVG format from a URL.

`Amplitude` For event tracking.


## Implemented Flows

#### `Login`

The login process includes 3 screens:

1. Screen to enter the National Identification Document (DNI) and gender.
2. Screen to enter the phone number and accept the terms and conditions.
3. Screen to enter the password.

#### `Home`

Tabbar that incluedes 4 screens:

1. Home
2. Promotions
3. Wallet
4. Profile Settings

## Some Screens

![image](https://github.com/nahuelglalin/MODO-clone/assets/78276469/ab47b78d-8fc9-467e-a64b-e50837dfac94)
![image](https://github.com/nahuelglalin/MODO-clone/assets/78276469/2e64d3e2-59c9-4c81-931e-d20451a6bc51)
![image](https://github.com/nahuelglalin/MODO-clone/assets/78276469/7c883d2c-df19-4c1e-99f6-9d275f8a1a50)
![image](https://github.com/nahuelglalin/MODO-clone/assets/78276469/c1927bd6-e2f6-4f43-940b-0fff56f2597c)
![image](https://github.com/nahuelglalin/MODO-clone/assets/78276469/8e02e9b6-9be6-4c7e-aef4-171985ec59db)



