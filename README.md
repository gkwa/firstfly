Learn how to install homebrew on linux using packer and lxc/incus.

```bash
git clone https://github.com/taylormonacelli/firstfly
cd firstfly
incus admin init --auto
packer init .
packer build homebrew.pkr.hcl
packer build homebrew2.pkr.hcl
```
