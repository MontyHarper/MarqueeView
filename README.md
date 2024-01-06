# MarqueeView
A SwiftUI text view that scrolls smoothly from right to left in a continuous loop.

# About This Code
To read about my inspiration, creation process, and thinking behind the code, please see [this article on Dev](https://dev.to/montyharper/marqueeview-smoothly-scrolling-text-in-an-infinite-loop-using-swiftui-2idp).

# How It Works
This code can easily be used inside any SwiftUI project. 
First, create a MarqueeController instance by passing in a String to be displayed.
```
let marqueeController = MarqueeController(message: yourMessageHere)
```
Then place the view by passing in your MarqueeController.
```
MarqueeView(controller: marqueeController)
```
That's it. The string yourMessageHere will scroll forever and ever.

You could also test it out by placing this inside your ContentView:
```
MarqueeView(controller: MarqueeController(message: "This is a test. This text will scroll smoothly from right to left forever and ever.  *  "))
```

# Customization
You can change the speed of the scroll by changing the value for `let speed` in the MarqueeController.

You can also change the font or font size by making changes to `let marqueeFont` in the MarqueeController. Make sure to use UIFont in order for the width calculations to work.

# Licensing
I've published this under The MIT Licence, so please feel free to use it, but also please keep my name and github link in the comments. Thanks!

# Contributing
If you have any questions, suggestions, or requests, please leave a message.
If you want to make a significant contribution to the functionality of this code, please send a pull request. 
Explain your changes and what they are meant to accomplish, and I will consider them. 
Thanks!


