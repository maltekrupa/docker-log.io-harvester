# Log.io-harvester Docker Container

## Contains
- log.io-harvester

## Example

You can find log.io-server in the corresponding repository [docker-log.io-server](https://github.com/temal-/docker-log.io-server).

```
docker run -d -v /path/to/config:/home/logio/.log.io -v /var/log/apache2:/logs/apache2 --name logio-harvester temal/logio-harvester
```

### What you need to provide
#### Logfiles

Files for the harvester to read. In this example, the logfiles are available at /var/log/apache2 on the host and /logs/apache2 in the docker container. 

#### Harvester configuration

Filename harvester.conf at /path/to/config.

An example for harvester.conf fiting our example here would be:
```
exports.config = {
    nodeName: "webserver01",
    logStreams: {
      apache: [
        "/logs/apache2/access.log",
        "/logs/apache2/error.log"
      ]
    },
    server: {
      host: 'CHANGEME',
      port: 28777
    }
  }
```

### Linking of containers

Remember to change the server host to the corresponding log.io-server host.
If you link them with "--link logio-server:logserver" you can change the value of "host" to "logserver".
If you have a static IP for you logio-server instance, you can also just put this IP into the config.
