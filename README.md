# Rick and Morty App (SwifUI)

This is an app using the Rick and Morty API: https://rickandmortyapi.com/ 
It's written in SwiftUI to display the characters from the show:

/*Animations will be displayed here*/


###  Alamofire Dependency:

- Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. 

Once you have your Swift package set up, adding Alamofire as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.1"))
]
```

- Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate Alamofire into your project manually.

If you have any questions, you can consult the information for its correct implementation here:

https://github.com/Alamofire/Alamofire/blob/master/README.md


