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

### Retrieve Apple Music catalog resources by ids.

Supported values are: `albums, artists, musicVideos, playlists, songs`.

```swift
let response = try await amuseProvider.catalog(.albums, ids: ["123", "456", "789"])
print(response.data)
```

```swift
amuseProvider.catalog(.albums, ids: ["123", "456", "789"])
    .sink { _ in
    } receiveValue: { response in
        print(response.data)
    }
```

### Search on Apple Music catalog.

```swift
let response = try await amuseProvider.catalogSearch(searchTerm: "YOUR_QUERY_TEXT")
print(response.results?.albums)
print(response.results?.artists)
print(response.results?.musicVideos)
print(response.results?.playlists)
print(response.results?.songs)
print(response.results?.stations)
```

```swift
amuseProvider.catalogSearch(searchTerm: "YOUR_QUERY_TEXT")
    .sink { _ in
    } receiveValue: { response in
        // content will be found under results properties.
        print(response.results?.albums)
        print(response.results?.artists)
        print(response.results?.musicVideos)
        print(response.results?.playlists)
        print(response.results?.songs)
        print(response.results?.stations)
    }
```

### Search on Apple Music catalog for specific resources types.

```swift
let response = try await amuseProvider.catalogSearch([.playlists, .songs], searchTerm: "YOUR_QUERY_TEXT")
print(response.results?.playlists)
print(response.results?.songs)
```

```swift
amuseProvider.catalogSearch([.playlists, .songs], searchTerm: "YOUR_QUERY_TEXT")
    .sink { _ in
    } receiveValue: { response in
        print(response.results?.playlists)
        print(response.results?.songs)
    }
```

### Retrieve User Library resources.

Supported values are: `albums, artists, musicVideos, playlists, songs`.

```swift
let response = try await dataProvider.library(.albums)
print(response.data)
```

```swift
amuseProvider.library(.albums)
    .sink { _ in
    } receiveValue: { response in
        print(response.data)
    }
```

### Search on User Library.

```swift
let response = try await amuseProvider.librarySearch(searchTerm: "YOUR_QUERY_TEXT")
print(response.results?.albums)
print(response.results?.artists)
print(response.results?.musicVideos)
print(response.results?.playlists)
print(response.results?.songs)
```

```swift
amuseProvider.librarySearch(searchTerm: "YOUR_QUERY_TEXT")
    .sink { _ in
    } receiveValue: { response in
        // content will be found under results properties.
        print(response.results?.albums)
        print(response.results?.artists)
        print(response.results?.musicVideos)
        print(response.results?.playlists)
        print(response.results?.songs)
    }
```

### Search on User Library for specific resources types.

```swift
let response = try await amuseProvider.librarySearch([.playlists, .songs], searchTerm: "YOUR_QUERY_TEXT")
print(response.results?.playlists)
print(response.results?.songs)
```

```swift
amuseProvider.librarySearch([.playlists, .songs], searchTerm: "YOUR_QUERY_TEXT")
    .sink { _ in
    } receiveValue: { response in
        print(response.results?.playlists)
        print(response.results?.songs)
    }
```


