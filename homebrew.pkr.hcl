packer {
  required_plugins {
    incus = {
      version = ">= 1.0.0"
      source  = "github.com/bketelsen/incus"
    }
  }
}

source "incus" "focal" {
  image        = "images:ubuntu/focal"
  output_image = "homebrew-focal"
  reuse        = true
}

source "incus" "jammy" {
  image        = "images:ubuntu/jammy"
  output_image = "homebrew-jammy"
  reuse        = true
}

build {
  sources = ["incus.focal"]

  provisioner "shell" {
    scripts = [
      "slow.sh",
    ]
  }
}

build {
  sources = ["incus.jammy"]

  provisioner "shell" {
    scripts = [
      "slow.sh",
    ]
  }
}
