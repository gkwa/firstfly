build:
	packer build -only 'slow*' homebrew.pkr.hcl
	packer build -only 'fast*' homebrew.pkr.hcl
