I approached the task via iOS development using Swift on Xcode. You can load all the files into your Xcode and run this project.
Because of the differences between mobile development and web development, I made few major changes:
1. Since the mobile phone screen is small than computer screen. I choosed to show "Results" view and "Saved Properties" view in different screen view instead of puting them together in one screen view.
2. There is no "Hovering Over" activity in mobile usage, so I didn't implement "Hovering Over" to show the button.
3. I used "Favorite Button's image" to indicate the properties is added or removed from "Saved Properties" list. The "Saved Properties" view won't update the actions until users move away from the view and move back to the view. It gives the benefit to users when they mis-tap a property, they can easily tap it back without going to "Results" view to find it again.

PS: I have stored the JSON data in a web: https://api.myjson.com/bins/cmq8e
