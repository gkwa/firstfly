packer {
  required_plugins {
    incus = {
      version = ">= 1.0.0"
      source  = "github.com/bketelsen/incus"
    }
  }
}

source "incus" "jammy" {
  image        = "images:ubuntu/jammy"
  output_image = "homebrew-jammy-slow"
  reuse        = true
}

source "incus" "fast-jammy" {
  image        = "homebrew-jammy-slow"
  output_image = "homebrew-jammy-fast"
  reuse        = true
}

source "incus" "focal" {
  image        = "images:ubuntu/focal"
  output_image = "homebrew-focal-slow"
  reuse        = true
}

source "incus" "fast-focal" {
  image        = "homebrew-focal-slow"
  output_image = "homebrew-focal-fast"
  reuse        = true
}

build {
  name = "slow"
  sources = ["incus.jammy"]

  provisioner "shell" {
    scripts = [
      "slow.sh",
    ]
  }
}

build {
  name = "fast"
  sources = ["source.incus.jammy"]

  provisioner "shell" {
    scripts = [
      "fast.sh",
    ]
  }

  provisioner "shell" {
    scripts = [
      "test.sh",
    ]
  }
}

build {
  name = "slow-focal"
  sources = ["incus.focal"]

  provisioner "shell" {
    scripts = [
      "slow.sh",
    ]
  }
}

build {
  name = "fast-focal"
  sources = ["source.incus.focal"]

  provisioner "shell" {
    scripts = [
      "fast.sh",
    ]
  }

  provisioner "shell" {
    scripts = [
      "test.sh",
    ]
  }
}
