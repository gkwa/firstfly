packer {
  required_plugins {
    incus = {
      version = ">= 1.0.0"
      source  = "github.com/bketelsen/incus"
    }
  }
}

source "incus" "focal" {
  image        = "homebrew-focal"
  output_image = "homebrew-focal-tested"
  reuse        = true
}

source "incus" "jammy" {
  image        = "homebrew-jammy"
  output_image = "homebrew-jammy-tested"
  reuse        = true
}

build {
  sources = ["incus.focal"]

  provisioner "shell" {
    scripts = [
      "fast.sh",
    ]
  }

  provisioner "shell" {
    scripts = [
      "test2.sh",
    ]
  }
}

build {
  sources = ["incus.jammy"]

  provisioner "shell" {
    scripts = [
      "fast.sh",
    ]
  }

  provisioner "shell" {
    scripts = [
      "test2.sh",
    ]
  }
}
