# AmuseKit
A swift package to facilitate Apple Music Api integration for iOS, MacOS, tvOS & watchOS projects.

## USAGE

### Import
```swift
import AmuseKit
```

### Init AmuseKit provider.

You can initialize AmuseKit using a StorageConfiguration that specifies service name and keys that will be used to save developer token & user token on keychain.

```swift
let configuration = AmuseKit.StorageConfiguration(serviceName: "KEYCHAIN_SERVICE_NAME",
                                                  developerTokenKey: "DEV_TOKEN_KEYCHAIN_KEY",
                                                  userTokenKey: "USER_TOKEN_KEYCHAIN_KEY")
let amuseProvider = AmuseKit.DataProvider(configuration)
amuseProvider.setDeveloperToken("YOUR_DEV_TOKEN")
```

### Set User Token.

```swift
amuseProvider.setUserToken("USER_TOKEN")
```

### Set User Country Code.

```swift
amuseProvider.setUserCountryCode("USER_COUNTRY_CODE")
```


### Retrieve User Library Playlists.

```swift
amuseProvider.libraryPlaylists()
    .sink { _ in
    } receiveValue: { response in
        print(response.data)
    }
```

### Retrieve User Library Songs.

```swift
amuseProvider.libraryAlbums()
    .sink { _ in
    } receiveValue: { response in
        print(response.data)
    }
```

### Retrieve User Library Songs.

```swift
amuseProvider.librarySongs()
    .sink { _ in
    } receiveValue: { response in
        print(response.data)
    }
```

### Search on Apple Music catalog.

```swift
amuseProvider.catalogSearch(searchTerm: "YOUR_QUERY_TEXT")
    .sink { _ in
    } receiveValue: { response in
        // content will be found under results properties.
        print(response.results?.albums)
        print(response.results?.artists)
        print(response.results?.playlists)
        print(response.results?.songs)
    }
```

### Search on Apple Music catalog for specific types.

```swift
amuseProvider.catalogSearch([.playlists, .songs], searchTerm: "YOUR_QUERY_TEXT")
    .sink { _ in
        // handle error
    } receiveValue: { response in
        print(response.results?.playlists)
        print(response.results?.songs)
    }
```


