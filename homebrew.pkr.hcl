packer {
  required_plugins {
    incus = {
      version = ">= 1.0.0"
      source  = "github.com/bketelsen/incus"
    }
  }
}

source "incus" "focal" {
  image      = "images:ubuntu/focal"
  image_name = "homebrew-focal"
  reuse      = true
}

source "incus" "jammy" {
  image      = "images:ubuntu/jammy"
  image_name = "homebrew-jammy"
  reuse      = true
}

build {
  sources = ["incus.focal", "incus.jammy"]

  provisioner "shell" {
    scripts = [
      "slow.sh",
    ]
  }

  post-processor "incus" {
    only        = ["incus.focal"]
    input_image = "homebrew-focal"
    image_name  = "homebrew-focal-tested"

    provisioner "shell" {
      scripts = [
        "fast.sh",
        "test2.sh",
      ]
    }
  }

  post-processor "incus" {
    only        = ["incus.jammy"]
    input_image = "homebrew-jammy"
    image_name  = "homebrew-jammy-tested"

    provisioner "shell" {
      scripts = [
        "fast.sh",
        "test2.sh",
      ]
    }
  }
}
