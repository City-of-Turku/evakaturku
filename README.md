<!--
SPDX-FileCopyrightText: 2021 City of Turku

SPDX-License-Identifier: LGPL-2.1-or-later
-->

# eVakaTurku 
eVakaTurku aka eVaka Turku – ERP for early childhood education in Turku.

This repository contains the code for customizing, configuring and extending the Espoo eVaka ERP for use in Turku early education.

## Getting eVakaTurku dev environment up and running

### Prerequisites - needed software and tools
See [eVaka README](evaka/compose/README.md#Dependencies)


### Starting eVakaTurku dev environment
1. `cd compose`
2. `docker-compose -f docker-compose-dbs.yml up -d --build`
3. `pm2 start` (starts all apps)
4. Open browser: http://localhost:9099/

## Running eVakaTurku frontend tests

### e2e ([Playwright](https://playwright.dev/)):

1. Start eVakaTurku dev environment
2. `cd e2e`
3. `yarn e2e-playwright`


### For WSL users:

Install a tool for running X Window System, eg. [GWSL](https://www.microsoft.com/en-us/p/gwsl/9nl6kd1h33v3#activetab=pivot:overviewtab).


## Submodules
eVakaTurku utilizes the [eVaka-repository](https://github.com/espoon-voltti/evaka) as its submodule. When cloning the repository use `--recurse-submodules`
or manually initialize and update the submodule after cloning with `git submodule update --init`.


## License

eVakaTurku is published under **LGPL-2.1-or-later** license. Please refer to
[LICENSE](LICENSE) for further details.

### Bulk-licensing

Bulk-licensing is applied to certain directories that will never contain
anything but binary-like files (e.g. certificates) with.
[a DEP5 file](./.reuse/dep5) (see
[docs](https://reuse.software/faq/#bulk-license)).

### Check licensing compliance

This repository targets [REUSE](https://reuse.software/) compliance by utilizing
the [reuse CLI tool](https://git.fsfe.org/reuse/tool).

To check that the repository is compliant (e.g. before submitting a pull
request), run:

```sh
./bin/add-license-headers.sh --lint-only

# See also:
./bin/add-license-headers.sh --help
```

**NOTE:** The tool has no concept for "no license", so currently it will
always fail for the following files:

- [invoicing WSDL files](service/src/main/schema)

### Automatically add licensing headers

To **attempt** automatically adding licensing headers to all source files, run:

```sh
./bin/add-license-headers.sh
```

**NOTE:** The script uses the [reuse CLI tool](https://git.fsfe.org/reuse/tool),
which has limited capability in recognizing file types but will give some
helpful output in those cases, like:

```sh
$ ./bin/add-license-headers.sh
usage: reuse addheader [-h] [--copyright COPYRIGHT] [--license LICENSE]
                       [--year YEAR]
                       [--style {applescript,aspx,bibtex,c,css,haskell,html,jinja,jsx,lisp,m4,ml,python,tex}]
                       [--template TEMPLATE] [--exclude-year] [--single-line]
                       [--multi-line] [--explicit-license]
                       [--skip-unrecognised]
                       path [path ...]
reuse addheader: error: 'frontend/packages/employee-frontend/src/components/voucher-value-decision/VoucherValueDecisionActionBar.tsx' does not have a recognised file extension, please use --style, --explicit-license or --skip-unrecognised
```
