# Server

```
thin start -R config.ru
```

# Web Client

```
open http://localhost:3000/
```

# Ruby Client

This is a read only, passive interface that will just parrot all the data it receives from the "/messages/public"

```
ruby client.rb
```