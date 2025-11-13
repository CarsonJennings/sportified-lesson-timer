# Sportified Lesson Timer

A simple Flutter app with a list of drills that each have a countdown timer.

## Getting Started

If you do not already have Flutter installed in your environment make sure to install and set up Flutter. Some resources can be found here:
-  https://docs.flutter.dev/get-started/install


## How to run it

Once you have properly installed Flutter and pulled or forked the code from this repo you can run the following command to start running the app in chrome: `flutter run -d chrome`. Alternatively you can run your app in the Android Emulator (Android Studio → Virtual Device).

## What I learned

Before starting this project I had never used Flutter or written a single line of dart code. It definitely took a little bit of getting used to and I obviously still have much to learn. Flutter is different from many of the common web frameworks such as React as it isn't based in HTML, CSS, and JavaScript. Flutter uses an object oriented programing approach to frontend development which is something that I haven't seen. In order to build your app Flutter uses prebuilt classes and objects which have various properties you can set and nest within eachother in order to design your layout and style your components. One of the nice things I found about Flutter is that it's like you have your own builtin component library. With all of the prebuilt classes and objects it takes very minimal effort to make your design look good. One thing that I liked was that you can set a seed color in your apps theme and Flutter automatically creates primary, secondary, background colours, and so on that generally work really well together.
 
 ## How I used AI

 During this project I used AI for a couple of different things. The first thing that I used AI for was to help me come up with a good design/layout for the app. I find that sometimes getting a good looking design can take some time and finding perfect amount of spacing between components can be time consuming. Getting AI to help with the design allows me focus on building the actual content. My other usage of AI was to help debug any issues that I had while developing the app.
   
## Anything that didn’t work but I attempted
I was attempting to set the dark/light mode toggle to the system preferences initially and then allow the user to toggle between the two within the app. However, I kept running into sublte bugs where the toggle would not work on the initial click or the initial icon wouldn't properly reflect the current theme mode. I settled on simply setting the default to light mode regardless of the system settings.
