# my-dev-env

My Docker development environment.

## my-python-dev-env

[![python-dev-env-publish](https://github.com/JoJoJotarou/my-dev-env/workflows/python-dev-env-publish/badge.svg)](https://github.com/JoJoJotarou/my-dev-env/actions/workflows/python-dev-env-publish.yml)

pull:

```bash
docker pull jojojotarou/python:<tag>
```

Valid tags:

```text
3.7.13-alpine3.15
3.8.13-alpine3.15
3.9.12-alpine3.15
3.10.4-alpine3.15
```

Default user `dev`. If you use vscode to connect containers, do `. ~/vscext.sh` install the prepared extensions.

If you want login as root, do this:

```bash
docker exec -it --user root <containerID> bash
```
