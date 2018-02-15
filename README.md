# Varnish Docker container

A clone of ``million12/docker-varnish``

Notable changes: 

* Pass VCL config's contents as an env variable instead of pushing config to 
  volume 
* Namespaced all varibles with ``VARNISH_``

> Centos 7  
> Varnish 4.x

## Usage

To use this container, you will need to provide your custom config.vcl (which is usually the case).

```
docker run -d \
  --link web-app:backend-host \
  --volumes-from web-app \
  --env 'VARNISH_ACL_CONFIG=[[base64 encoded vcl file contents]]' \
  million12/varnish
```

In the above example we assume that:
* You have your application running inside `web-app` container and web server there is running on port 80 (although you don't need to expose that port, as we use --link and varnish will connect directly to it)
* `web-app` container has `/data` volume with `varnish.vcl` somewhere there
* `web-app` is aliased inside varnish container as `backend-host`
* Your `varnish.vcl` should contain at least backend definition like this:  
```
backend default {
    .host = "backend-host";
    .port = "80";
}
```

## Environmental variables

You can configure Varnish daemon by following env variables:

* **VARNISH_ACL_CONFIG** ``base64 encoded config file``
* **VARNISH_CACHE_SIZE** `64m`  
* **VARNISH_VARNISHD_PARAMS** `-p default_ttl=3600 -p default_grace=3600`


## Author(s)

* Marcin Ryzycki (<marcin@m12.io>)  
* Przemyslaw Ozgo (<linux@ozgo.info>)
* Jacek Bzdak (jacek@askesis.pl)

---

**Sponsored by** [Typostrap.io - the new prototyping tool](http://typostrap.io/) for building highly-interactive prototypes of your website or web app. Built on top of TYPO3 Neos CMS and Zurb Foundation framework.
