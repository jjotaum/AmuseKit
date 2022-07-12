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

### Retrieve multiple Albums from Apple Music catalog by ids.

```swift
amuseProvider.catalog(.albums, ids: ["123", "456", "789"])
    .sink { _ in
    } receiveValue: { response in
        print(response.data)
    }
```

### Retrieve multiple Artists from Apple Music catalog by ids.

```swift
amuseProvider.catalog(.artists, ids: ["123", "456", "789"])
    .sink { _ in
    } receiveValue: { response in
        print(response.data)
    }
```

### Retrieve multiple Music Videos from Apple Music catalog by ids.

```swift
amuseProvider.catalog(.musicVideos, ids: ["123", "456", "789"])
    .sink { _ in
    } receiveValue: { response in
        print(response.data)
    }
```

### Retrieve multiple Playlists from Apple Music catalog by ids.

```swift
amuseProvider.catalog(.playlists, ids: ["123", "456", "789"])
    .sink { _ in
    } receiveValue: { response in
        print(response.data)
    }
```

### Retrieve multiple Songs from Apple Music catalog by ids.

```swift
amuseProvider.catalog(.songs, ids: ["123", "456", "789"])
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
    } receiveValue: { response in
        print(response.results?.playlists)
        print(response.results?.songs)
    }
```

### Retrieve All User's Library Albums.

```swift
amuseProvider.library(.albums)
    .sink { _ in
    } receiveValue: { response in
        print(response.data)
    }
```

### Retrieve All User's Library Artists.

```swift
amuseProvider.library(.artists)
    .sink { _ in
    } receiveValue: { response in
        print(response.data)
    }
```

### Retrieve All User Library Music Videos.

```swift
amuseProvider.library(.musicVideos)
    .sink { _ in
    } receiveValue: { response in
        print(response.data)
    }
```

### Retrieve All User's Library Playlists.

```swift
amuseProvider.library(.playlists)
    .sink { _ in
    } receiveValue: { response in
        print(response.data)
    }
```

### Retrieve All User's Library Songs.

```swift
amuseProvider.library(.songs)
    .sink { _ in
    } receiveValue: { response in
        print(response.data)
    }
```

### Search on User's Library.

```swift
amuseProvider.librarySearch(searchTerm: "YOUR_QUERY_TEXT")
    .sink { _ in
    } receiveValue: { response in
        // content will be found under results properties.
        print(response.results?.albums)
        print(response.results?.artists)
        print(response.results?.playlists)
        print(response.results?.songs)
    }
```

### Search on User's Library for specific types.

```swift
amuseProvider.librarySearch([.playlists, .songs], searchTerm: "YOUR_QUERY_TEXT")
    .sink { _ in
    } receiveValue: { response in
        print(response.results?.playlists)
        print(response.results?.songs)
    }
```


