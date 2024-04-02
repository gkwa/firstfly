Learn how to install homebrew on linux using packer and lxc/incus.

```bash
git clone https://github.com/taylormonacelli/firstfly
cd firstfly
incus admin init --auto
packer init .

# build all slow images first
packer build -only 'slow*' homebrew.pkr.hcl
# next build fast
packer build -only 'fast*' homebrew.pkr.hcl

# build all
packer build -only slow.incus.jammy homebrew.pkr.hcl

# example wildcards
packer build -only 'fast*' homebrew.pkr.hcl
packer build -only 'fast*focal*' homebrew.pkr.hcl

# slow and fast for focal and jammy
packer build homebrew.pkr.hcl


# doing this builds the correct order: base and then fast.sh
# focal and jammy slow are built and then focal and jammy fast are built from image output from slow build
packer build -only 'slow*' homebrew.pkr.hcl &&
packer build -only 'fast*' homebrew.pkr.hcl
```

## docs

- [globs](https://developer.hashicorp.com/packer/docs/templates/hcl_templates/onlyexcept)
