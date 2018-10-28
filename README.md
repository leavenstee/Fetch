# Fetch
Simple Swift HTTPS Request Framework

## Setup

1. Import Fetch

`import Fetch`

2. Access Singleton

`let fetcher = Fetch.sharedFetcher`

3. Make Request

### GET

```
/**
GET Request
- parameters:
- urlString: String of the url that is used to make the request
- params: Dictonary of type [String:String] to pass with the request
- completion: Completion block of type Any passed back from result of fetch
*/
fetcher.get(urlString: "https://picsum.photos/list", params: nil) { (json) in
    // Handle Logic For GET Request
}
```

### POST

### DELETE

### PUT

TODO
