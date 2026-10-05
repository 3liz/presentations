---
marp: true
theme: gaia
paginate: true
class: invert
header: '![height:40px](media/logo_3liz.png)'
footer: '![height:30px](media/events/qgis-uc-2026-laax.webp) QGIS UC 2026 - Yet Another Plugin Tool'
style: |
    section > header > img {
        float: right;
    }
    section {
        font-size: 1.8em;
        padding: 30px;
    }
    section.lead {
        background: #3182be;
    }
    h1 {
      font-size: 1.5em;
    }
    ul {
      margin-top: 0px;
    }
    ul li {
      font-size: 1em;
    }
    section.centertitle h1 {
        text-align: center;
    }
    img[alt~="center"] {
      display: block;
      margin: 0 auto;
    }
    img[alt~="smaller"] {
      max-width: 80%;
      height: auto;
    }
    img[alt~="ssmaller"] {
      max-width: 70%;
      height: auto;
    }
    img[alt~="sssmaller"] {
      max-width: 60%;
      height: auto;
    }
    code { font-size: 1em; }
    @media print{
      section {
        font-size: 1.4em;
      }
    }
    @supports (-moz-appearance:none) {
      section {
        font-size: 1.4em;
      }
    }
---
# YAPT

## Yet Another Plugin Tool

### Server, manager and publisher


- qgis-plugins-server - yapt-server
- https://github.com/3liz/yapt-manager
- https://github.com/3liz/yapt-package


![bg right:50%](media/Logo_car_coul.png)

---
# Disclaimer - Spoiler

<!-- _class: lead gaia-->

To each his own!

![ssmaller height:250px center](media/rust-cuddlyferris.svg)

We love CRAB!

<!--
Tous les goûts sont danss la nature !
Even if QGIS loves Python, we love CRAB and Rust.
-->

---
# Historic situation

## Our needs

- Internal plugins repository for public and in dev plugins
- Clients plugins repository for in dev plugins
- Deploying QGIS Server plugins on our Lizmap hosting infrastructure

**Do not overload plugins.qgis.org**

## Implementation

- File server
- XML files listing available plugins
- qgis-plugin-manager

<!--
At 3Liz, for our internal needs, for our clients, and for deploying QGIS Server plugins on our Lizmap hosting infrastructure, we used a file server, XML files listing the available plugins, and qgis-plugin-manager.

We also don't want to overload plugins.qgis.org
-->

---
# qgis-plugin-manager

<!-- _class: lead gaia-->

CLI tool to manage QGIS plugins

```bash
$ qgis-plugin-manager --help
usage: qgis-plugin-manager [-h] [-v] {version,init,list,install,remove,upgrade,remotes,update,cache,versions,search,check} ...

options:
  -h, --help            show this help message and exit
  -v, --verbose         Activate verbose (debug) mode (default: False)

commands:
  qgis-plugin-manager command

  {version,init,list,install,remove,upgrade,remotes,update,cache,versions,search,check}
    version             Show version informations and exit
    init                Create the `sources.list` with plugins.qgis.org as remote
    list                List all plugins in the directory
    install             Install a plugin
    remove              Remove a plugin by its name
    upgrade             Upgrade all plugins installed
    remotes             List all remote server
    update              Update all index files
    cache               Look for available plugin in the cache - Deprecated
    versions            Look for available plugin latest versions
    search              Search for plugins
    check               Check compatibility of installed plugins with QGIS version
```

<!--
qgis-plugin-manager is a command-line tool for managing installed QGIS plugins. Designed primarily for managing QGIS Server extensions, it also works with QGIS Desktop extensions.

It is witten in Python and available with PIP.
-->

---
# Evolution of our needs

## Multiple In-dev plugins versions: -pre

For exemple:

- master with QGIS4 support
- stable Without QGIS4 support

Or:

- master with code refactoring
- stable with bugfixings only

Pushed to plugins repository for manual or automatic tests

## Install specific version of a plugin even if it is not the last one

<!--
Our needs have evolved over the years. We need to be able to manage multiple versions of a plugin in development. We also need to install specific versions of a plugin even if it is not the last one.

We have some trouble with the simple XML file and we want to replace it with a more robust solution. We need a QGIS Plugins server.
-->

---
# QGIS plugins server - The YAPT Server

<!-- _class: lead gaia-->

QGIS Plugin Repository Server: It maintains a catalog of packages populated by archive uploads via HTTP.

```bash
curl -X POST -F "file=@monplugin.1.0.0.zip" http://localhost:8070/plugins/
curl "http://localhost:8070/plugins.xml?qgis=3.40"
```


![ssmaller height:250px center](media/yapt-qgis-uc-2026/rust-cuddlyferris-plugins.svg)



<!--
So we build in Rust a QGIS Plugins Server to replace the simple XML file and files server. It is a simple HTTP files server dedicated to QGIS Plugins.
-->

---
# QGIS plugins server - The YAPT Server

## Features

- **Automatic extraction of metadata** (metadata.txt) from the uploaded archive;
- Catalog updates without the **risk of concurrent access**;
- **Plugin filtering** by QGIS version, tag, and status (experimental, deprecated, server plugin);
- Catalog available in **XML (QGIS Desktop) and JSON**;
- HTTP cache management (ETag / Last-Modified);
- Optional TLS and client certificate authentication (mTLS).

## It is not

- A web site like qgis.plugin.org
- A security validator (no virus scan, no code analysis)

<!--
The YAPT Server firstly extracts the metadata from the uploaded plugin archive, to update the plugins catalog without the risk of concurrent access. The catalog is available in XML (QGIS Desktop) and alos in JSON.

The YAPT server is not a web site like qgis.plugin.org. It does not analyze the code of the plugin. It does not scan for viruses. It does not provide a web interface to users.

It is mainly a REST API to upload plugins and to get the catalog of plugins.
-->

---
# QGIS plugins server - The YAPT Server

## API HTTP - GET

```bash
# XML Catalog for QGIS 3.40, including experimental versions
curl "http://localhost:8070/plugins.xml?qgis=3.40&pre=true"
# Only server plugins, in JSON
curl "http://localhost:8070/plugins.json?qgis=3.40&server=true"
# All versions of a plugin
curl "http://localhost:8070/plugins/lizmap-server/plugins.json?qgis=3.40&all=true&pre=true"
```

## API HTTP - POST

```bash
curl -i -X POST \
    -H "X-Upload-Agent: gitlab-ci" \
    -F "file=@lizmap-server.2.16.0.zip" \
    -F "checksum=@lizmap-server.2.16.0.zip.sha256" \
    "https://plugins.example.org/plugins/"
```

### API HTTP - DELETE

```bash
curl -X DELETE "https://plugins.example.org/plugins/lizmap-server/?version=%3D2.16.0"
{"removed":[["lizmap-server","2.16.0"]]}
```

<!--
Here are the 3 HTTP methods (words) available with YAPT server.
-->

---
# QGIS plugins server - The YAPT Server

## API HTTP - GET -Routes

| Methods | Route | Description |
| --- | --- | --- |
| `GET`, `HEAD` | `/plugins.xml` | Catalog XML (QGIS Desktop) |
| `GET`, `HEAD` | `/plugins.json` | Catalog JSON |
| `GET`, `HEAD` | `/plugins/` | Catalog JSON (alias) |
| `GET`, `HEAD` | `/plugins/<slug>/plugins.xml` | Catalog XML for only one plugin |
| `GET`, `HEAD` | `/plugins/<slug>/plugins.json` | Catalog JSON for only opne plugin |
| `GET`, `HEAD` | `/plugins/<slug>/` | Catalog JSON for only one plugin |


<!--
YAPT defeinde these defferents routes to get the plugins catalog.
It provides a way to get the catalog for all the uploaded plugins or the catalog only for one plugin.
-->

---
# QGIS plugins server - The YAPT Server

## API HTTP - GET - Request parameters:

| Parameter | Value | Default | Description |
| --- | --- | --- | --- |
| `qgis` | version | — | **Required**. Target QGIS version (`3.40`, `3.40.2`, …) |
| `pre` | `true`/`false` | `false` | Includes experimentals versions |
| `deprecated` | `true`/`false` | `false` | Includes deprecated plugins |
| `server` | `true`/`false` | `false` | Only server plugins |
| `all` | `true`/`false` | `false` | Returns all versions, JSON only |
| `tags` | texte | — | Approximate search based on the plugin's name and tags |

- Boolean values must be specified explicitly: `?pre=true`. `?pre` or `?pre=1` returns `400`.
- Without `all=true`, the catalog contains no more than two versions per plugin, like **qgis.plugins.org**.

<!--
The qgis GET parameter is required and works as like the one provided by plugins.qgis.org. The other parameters are optional, helps filtering the catalog, exccept for the all parameter which is designed to work with JSON output to provided all published versions.
-->

---
# QGIS plugins server - The YAPT Server

## API HTTP - POST

```
POST /plugins/[?pre=true|false]
```

`multipart/form-data` body:

| Field | Required | Description |
| --- | --- | --- |
| `file` | yes | The plugin's `.zip` archive |
| `sig` | no | Archive signature |
| `checksum` | no | Checksum file |
| `checksum_sig` | no | Checksum signature |

- Optional header `X-Upload-Agent`: stored in the field `uploadedBy`
- Parameter `pre` overides the `experimental` field of `metadata.txt`

<!--
To upload a new plugin package, you just have to send POST request with multipart/form-data body, that contains the plugin zip file, the signature file and the checksum.
The experimental field can be overriding at the request level with the pre parameter.
-->
---
# QGIS plugins server - The YAPT Server

## API HTTP - DELETE

```
DELETE /plugins/<slug>/?version=<requirement>
```
<br/>
<br/>

- `version` is a constraint in [SemVer](https://semver.org) format
(`=0.1.0`, `<1.0.0`, `>=1.0, <2.0`, …).
- ⚠️ **Warning**: `version=0.1` is interpreted as `^0.1` and therefore deletes all `0.1.x` versions; use `=0.1.0` for an exact match.
- The corresponding archives are deleted from disk and the catalog is rewritten. The response lists the versions that were actually deleted.

<!--
Last request to remove one or more versions of a plugin can be performed with DELETE request.
-->

---
# QGIS plugins server - The YAPT Server

<!-- _class: lead gaia-->

## Not Ready Yet

Tested on ~20 plugins only
No database providers to store plugins metadata

![ssmaller height:250px center](media/yapt-qgis-uc-2026/rust-cuddlyferris-plugin-zip.svg)

<!--
The YAPT server is not ready yet
We used it for our needs. We used it for plugins around Lizmap to deploy them on our hosting servcies and plugins for custormers to deliver expriremental for manual tests before deploying them on plugins.qgis.org
-->

---
# YAPT - Now that we're here, why not keep going?

<!-- _class: invert centertitle-->

<br/>
<br/>
<br/>
<br/>

![ssmaller height:250px center](media/rust-cuddlyferris.svg)

<!--
Now, we have our own QGIS Plugins server written in Rust with extra features, why not continuing to develop more tools in Rust to help packaging and managing QGIS plugins ?
-->
---
# YAPT-pkg

<!-- _class: lead gaia-->

![ssmaller height:250px center](media/yapt-qgis-uc-2026/rust-cuddlyferris-plugin-zip.svg)

https://github.com/3liz/yapt-package

<!--
So we build YAPT package, a command line tool to package QGIS plugins.
-->

---
# YAPT-pkg - The YAPT packager

<!--
Like **qgis-plugin-ci**: CLI tool for packaging QGIS plugins
Not like **qgis-plugin-ci**: it is not written in Python but in Rust
and it does not provide a tool to push and pull from transifex.
-->

```bash
# Basic package creation
yapt-pkg package

# Create archive with prerelease version
yapt-pkg package --pre

# Create archive in specific directory
yapt-pkg package -o ./dist

# Generate package XML for QGIS
yapt-pkg package --xml "https://example.com/downloads/"

# Publish to QGIS plugin repository
yapt-pkg package --publish --osgeo-username "user" --osgeo-password "pass"

# Publish with environment variables
OSGEO_USERNAME=user OSGEO_PASSWORD=pass yapt-pkg package --publish

# Dry run (test connection)
yapt-pkg package --publish --dry-run
```

---
# YAPT-pkg - The YAPT packager

```bash
# Get changelog for current version (from pyproject.toml)
yapt-pkg changelog

# Get changelog for specific version
yapt-pkg changelog --version "1.0.0"
```

Configuring metadata can be done in `pyproject.toml` not only in `metadata.txt`.

Manage localisation with `qt-transifex` https://github.com/3liz/qt-transifex

---
# YAPT-manager

<!-- _class: lead gaia-->

![ssmaller height:250px center](media/yapt-qgis-uc-2026/rust-cuddlyferris-plugin-install-upgrade.svg)

https://github.com/3liz/yapt-manager

<!--
We also build a YAPT manager to take advatage of YAPT Server to manage QGIS plugins : JSON Catalog and parameters.
-->
---
# YAPT-manager - QGIS Plugin Manager

```bash
yapt-mngr --help
A QGIS plugin manager

Usage: yapt-mngr [OPTIONS] <COMMAND>

Commands:
  source   Manage sources
  list     List installed plugins
  find     Find plugins
  install  Install plugin(s)
  upgrade  Upgrade installed plugins with remote sources
  search   Search for plugins
  remove   Remove installed plugins
  help     Print this message or the help of the given subcommand(s)

Global options:
  -C, --config <CONFIG>              The configuration directory path (default to current dir) [env: YAPT_CONF_DIR=]
      --cache-dir <CACHE_DIR>        The cache directory (default to config dir) [env: YAPT_CACHE_DIR=]
      --no-sync                      Do no synchronize sources [env: YAPT_NO_SYNC=]
      --qgis-version <QGIS_VERSION>  The QGIS version [env: QGIS_VERSION=]
  -d, --install-dir <INSTALL_DIR>    Plugin installation directory [env: QGIS_PLUGINPATH=/var/qjazz/plugins]
      --no-progress                  Hide all progress outputs [env: YAPT_NO_PROGRESS=]
  -v, --verbose...                   Increase log verbosity
  -h, --help                         Display concise help
  -V, --version                      Display the program version
```

---
# YAPT-manager - QGIS Plugin Manager

```bash
yapt-mngr source --help
Manage sources

Usage: yapt-mngr source [OPTIONS] <COMMAND>

Commands:
  add     Add remote source
  remove  Remove remote source
  rename  Rename source
  list    List sources
  update  Fetch sources [alias: sync]
  check   Check for update
  help    Print this message or the help of the given subcommand(s)
```

---
# YAPT-manager - QGIS Plugin Manager

```bash
yapt-mngr list --help
List installed plugins

Usage: yapt-mngr list [OPTIONS]

Options:
  -o, --outdated         List outdated plugins
      --source <SOURCE>  Use only the specified source when searching for latest version
      --pre              Include pre-release, development and experimental versions [env: QGIS_PLUGIN_INCLUDE_PRERELEASE=]
```

```bash
yapt-mngr list
  3liz.org.... ✓ Up to date
  NAME             VERSION QGIS* SOURCE   LATEST FOLDER
atlasprint         3.4.4   3.28  3liz.org 3.4.4  /srv/qgis-server-plugins/atlasprint
Lizmap server      2.15.4  3.34  3liz.org 2.15.5 /srv/qgis-server-plugins/lizmap_server
wfsOutputExtension 1.8.3   3.28  3liz.org 1.8.3  /srv/qgis-server-plugins/wfsOutputExtension
(*) Minimum QGIS versions supported
```

```bash
yapt-mngr list --outdated
  3liz.org.... ✓ Up to date
  NAME             VERSION QGIS* SOURCE   LATEST FOLDER
Lizmap server      2.15.4  3.34  3liz.org 2.15.5 /srv/qgis-server-plugins/lizmap_server
(*) Minimum QGIS versions supported
```

---
# YAPT-manager - QGIS Plugin Manager

```bash
yapt-mngr find --help
Find plugins

Usage: yapt-mngr find [OPTIONS] <NAME>...

Arguments:
  <NAME>...  List of plugins with optional version specifiers

Options:
      --pre              Include pre-release, development and experimental versions [env: QGIS_PLUGIN_INCLUDE_PRERELEASE=]
      --deprecated       Include deprecated versions
      --source <SOURCE>  Use only the specified source
```

Find lizmap plugin with version 5.x.x from 3liz.org QGIS plugins server.

```bash
yapt-mngr find lizmap=5
  3liz.org.... ✓ Up to date
  lizmap:
NAME   VERSION QGIS SOURCE
Lizmap 5.0.3   3.34 3liz.org
Lizmap 5.0.2   3.34 3liz.org
Lizmap 5.0.1   3.34 3liz.org
Lizmap 5.0.0   3.34 3liz.org
```


---
# YAPT-manager - QGIS Plugin Manager

```bash
yapt-mngr search --help
Search for plugins

Usage: yapt-mngr search [OPTIONS] <NAME>

Arguments:
  <NAME>

Options:
      --by-name          Only search by plugin name
      --server           Consider only server plugins
      --all              Return all versions of plugins
      --pre              Include pre-release, development and experimental versions [env: QGIS_PLUGIN_INCLUDE_PRERELEASE=]
      --deprecated       Include deprecated versions
      --source <SOURCE>  Use only the specified source
```

```bash
yapt-mngr search lizmap,server
  3liz.org.... ✓ Up to date
  S  Server  X  Experimental  T  Trusted  D  Deprecated
NAME               VERSION QGIS* STATUS SOURCE
Lizmap             5.0.3   3.34  ----   qgis-plugins.3liz.org
Lizmap server      2.15.5  3.34  S---   qgis-plugins.3liz.org
wfsOutputExtension 1.8.3   3.28  S---   qgis-plugins.3liz.org
(*) Minimum QGIS versions supported
```

---
# YAPT-manager - QGIS Plugin Manager

```bash
yapt-mngr install --help
Install plugin(s)

Usage: yapt-mngr install [OPTIONS] <NAME>...

Arguments:
  <NAME>...  Plugins to install

Options:
      --pre              Include pre-release, development and experimental versions [env: QGIS_PLUGIN_INCLUDE_PRERELEASE=]
      --deprecated       Include deprecated versions
      --source <SOURCE>  Use only the specified source
      --reinstall        Force (re)installing
      --fix-permissions  Set files permissions to 0644
  -U, --upgrade          Upgrade plugin to latest version, if `--pre` is specified, the update will update to the latest experimental version if any
      --dry-run          Only show what would be installed
```

---
# YAPT-manager - QGIS Plugin Manager

```bash
yapt-mngr upgrade --help
Upgrade installed plugins with remote sources

Usage: yapt-mngr upgrade [OPTIONS]

Options:
      --pre              Include pre-release, development and experimental versions [env: QGIS_PLUGIN_INCLUDE_PRERELEASE=]
      --deprecated       Include deprecated versions
      --source <SOURCE>  Use only the specified source
      --reinstall        Force (re)installing
      --fix-permissions  Set files permissions to 0644
      --dry-run          Only show what would be installed
```

---
# YAPT-manager - QGIS Plugin Manager

```bash
yapt-mngr remove --help
Remove installed plugins

Usage: yapt-mngr remove [OPTIONS] <NAME>...

Arguments:
  <NAME>...  Plugins to remove
```

---
<!-- _class: invert centertitle -->

# Conclusion

- A set of tools written in **Rust** to manage QGIS plugins
- Nothing new - **Yet Another Plugin Tool**

<br/>

<br/>

<br/>

 ![ssmaller height:250px](media/yapt-qgis-uc-2026/rust-cuddlyferris-plugins.svg) <span style="color: black; font-size: 250px;">+</span> ![ssmaller height:250px](media/yapt-qgis-uc-2026/rust-cuddlyferris-plugin-zip.svg) <span style="color: black; font-size: 250px;">+</span> ![sssmaller height:250px](media/yapt-qgis-uc-2026/rust-cuddlyferris-plugin-install-upgrade.svg)

---
# Thank you

<br/><br/>

## Questions ?

![bg right:50%](media/Logo_car_coul.png)
