# HummingKit

HummingKit is an SDK (Software Development Kit) designed to ease the use of [Apple Music API](https://developer.apple.com/documentation/applemusicapi). Written in Swift 5.2, HummingKit takes advantage of Swift's outstanding performance and latest features, offering an approachable entry for developers dealing with the Apple Music API.

---
**NEWS**

HummingKit 1.1.2 has been RELEASED!
HummingKit 1.1.2 contains functionality improvements and addition, compatibility changes, and bug fixes.

---

## Features

HummingKit provides a friendly way to deal with the Apple Music API by handling burdensome works, such as composing and conducting requests, handling status and errors, parsing responses and more.

- [x] Apple Music API High Coverage
- [x] Apple Music API User Privacy Verification
- [x] Apple Music API Request Authentication
- [x] Apple Music API Request URL / JSON Parameter Encoding
- [x] Apple Music API Request Pagination
- [x] Apple Music API Request Asynchronous Status Handling
- [x] Apple Music API Response Decoding
- [x] Apple Music API Resource Relationships Fetching
- [x] [Documentation](https://tonytang2001.github.io/HummingKit/)
- [x] Usage Example: [Example Code](#Example-Code)

## Requirements

- Swift 5.2+
- Xcode 11+
- iOS 11.0+ / macOS 10.13+ * / tvOS 11.0+ / watchOS 4.0+ *
    (*) For certain functionalities, macOS 11.0+ / watchOS 7.0+ are required.

## Integration

HummingKit comes with flexibility in terms of integration. From [importing it as a dependency of your projects](#In-Your-Xcode-Project), to [building frameworks upon it](#In-Your-Framework), HummingKit provides an optimal integration solution.

### Swift Package Manager

[Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code specifically. HummingKit supports Swift Package from design.

---
**NOTE**

Once a Swift Package is added to an Xcode project, the package's dependency repositories are also added to the project automatically. HummingKit is of no exception of this rule.

---

#### In Your Xcode Project

When your project is opened in Xcode, select ``` File > Swift Packages > Add Package Dependency``` from the menu bar. Enter ```https://github.com/TonyTang2001/HummingKit.git``` once prompted to do so. After specifying ```Rules``` in accordance to your need and select Target to add to, HummingKit is successfully added to your project as a Swift Package.

#### In Your Framework

Once your Swift package is set up, add HummingKit as a dependency by adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
.package(url: "https://github.com/TonyTang2001/HummingKit.git", .upToNextMajor(from: "1.0.0"))
]
```

## Usage

HummingKit also offers great convenience for developers to use. Functionality layers can be separated and used in accordance to specific needs.

### Example Code

To properly access the Apple Music server from a user device, both a developer token and a user token are required for authentication purposes. Details can be found at [Getting Keys and Creating Tokens](https://developer.apple.com/documentation/applemusicapi/getting_keys_and_creating_tokens).

Upon using the following example codes, please replace ```<Your-Developer-Token>``` with the ```developer token``` you fetched from Apple, and replace ```<Device-User-Token>``` with the ```user token``` your app fetches on the user-end device.

#### Fetch Tokens

To fetch a ```developer token```, [this Gist](https://gist.github.com/sora0077/75b62f4a2a04480a90ef109a127ddbf5) offers a brief and functional script for temporary use and testing.

To fetch a ```user token```, call the ```HummingKitAuthentication.fetchUserToken()``` function as follows.

```
// Fetch an Apple Music user token on the user-end device
HummingKitAuthentication.fetchUserToken(developerToken: <Your-Developer-Token>) { result in
    switch result {
        case .success(let token):
            // Output user token to console
            print("Apple Music User Token: \(token)")
        case .failure(let err):
            // Output error (if occurred) to console
            print("Fetch User Token failed because: \(err)")
    }
}
```

#### API Request Generation

The ```HummingKitRequestFactory```, as a ```public class```, constructs API requests strictly following the [Apple Music API Documentation](https://developer.apple.com/documentation/applemusicapi). Use ```HummingKitRequestFactory``` **only if** all you need is creating the legal API requests.

First, create an instance of ```HummingKitRequestFactory``` as follows.

```
// Create an instance of HummingKitRequestFactory
let requestComposer = HummingKitRequestFactory(developerToken: <Your-Developer-Token>, userToken: <Device-User-Token>)
```

Then, call functions on this instance in accordance to your needs as follows. Pass in parameters if needed for this request.

```
// Prepare parameters
let storefront: String = "us"
let songID: String = "900032829"

// Create URL Request for fetching a catalog song resource from Apple Music server
let urlRequest: URLRequest = requestComposer.createGetACatalogSongRequest(storefront: storefront, songID: songID)
```

For some functions that potential throw ```Errors``` when certain conditions of the parameters aren't met, you will need to wrap the function in a ```do-catch``` statement as follows.

```
// Prepare parameters
let storefront: String = "us"
let songIDs: [String] = ["203709340", "201281527"]

// Create URL Request for fetching several catalog songs resource from Apple Music server
do {
    let urlRequest: URLRequest = try requestComposer.createGetMultipleCatalogSongsRequest(storefront: storefront, songIDs: songIDs)
} catch {
    // Handle the thrown error
    
}
```

#### API Request Constructing, Conducting & Parsing

The ```HummingKit```, as a ```public class```, streamlines and simplifies the workflow of **creating requests** and **conducting and parsing** their responses into different ```Resource Types```.

First, create an instance of ```HummingKit``` class as follows.

```
// Create an instance of HummingKit
let hummingKitObj = HummingKit(developerToken: <Your-Developer-Token>, userToken: <Device-User-Token>)
```

Then, call functions on this instance in accordance to your needs as follows. Pass in parameters if needed for this request.

```
// Prepare parameters
let storefront: String = "us"
let songIDs: [String] = ["203709340", "201281527"]

// Fetch several catalog songs resource from Apple Music server
hummingKitObj.fetchMultipleCatalogSongs(storefront: storefront, songIDs: songIDs) { result in
    switch result {
    case .success(let catalogSongs):
        // Do something with fetched catalog songs objects
        
    case .failure(let err):
        // Output error (if occurred) to console
        print(err)
    }
}
```

### More

As the above example code does not provide an exhaustive list of all the functions you may use, you may refer to the actual files of HummingKit for more functionality and details.

HummingKit introduces a list of custom Apple Music ```Resource Types``` that you may refer to in the ```DataModel.swift``` file for your convenience of usage. 

HummingKit also introduces a list of custom ```Error Types``` that you may refer to in the ```HummingKitErrors.swift``` file for their occurring situations.


## Community

HummingKit embraces developer community as an indispensable factor for creations and improvements. Everyone is welcome to collaborate on this project and providing feedbacks and suggestions. 

**Feel free to ask questions if you have one!**

### Collaboration

All scales of collaboration are welcome. From introducing a grand feature to fixing a typo among in-line comments, you are improving this project and contributing to the whole open-source community.

### Q&A

There might be questions regarding certain functionality or blocks of codes, or you may have found a serious bug in this project. Please file an issue in this repository. **Your words are important!**

## Dependencies

HummingKit is built upon widely-adopted frameworks for a portion of its functionality.

- [Alamofire](https://github.com/Alamofire/Alamofire)
- [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)

