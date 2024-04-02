Learn how to install homebrew on linux using packer and lxc/incus.

```bash
git clone https://github.com/taylormonacelli/firstfly
cd firstfly
packer init
packer build homebrew.pkr.hcl
time bash -e test.sh
```
