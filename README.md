Sc
==

CLI client for the SoundCloud API


### Fetch a tracks details

```
# sc track <id here>
<id here> | ProleteR - L.O.V.E | ProleteR | /soundcloud.com/proleter-beatmaker/proleter-love
```


## Building

```
mix deps.get
mix test
mix escript.build

./sc track 81753799
```