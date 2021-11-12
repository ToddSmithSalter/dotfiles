# .dotfiles for macOS

## What is this?

This repository services as a way to help setup and maintain my Mac. Consider this repository a fork of [Dries Vints](https://github.com/driesvints/dotfiles) dotfiles. For full instructions on a fresh macOS setup, follow the directions on Dries' repo.

## Steps to Setup you Mac

These instructions are for when you've already set up your dotfiles.

### Before you re-install

First, go through the checklist below to make sure you didn't forget anything before you wipe your hard drive.

- Did you commit and push any changes/branches to your git repositories?
- Did you remember to save all important documents from non-iCloud directories?
- Did you save all of your work from apps which aren't synced through iCloud?
- Did you remember to export important data from your local database?
- Did you update [mackup](https://github.com/lra/mackup) to the latest version and ran `mackup backup`?

### Installing macOS cleanly

After going to our checklist above and making sure you backed everything up, we're going to cleanly install macOS with the latest release. Follow [this article](https://www.imore.com/how-do-clean-install-macos) to cleanly install the latest macOS version.

### Setting up your Mac

1. Update macOS to the latest version with the App Store
2. [Generate a new public and private SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) by running:

   ```zsh
   curl https://raw.githubusercontent.com/ToddSmithSalter/dotfiles/HEAD/ssh.sh | sh -s "<your-email-address>"
   ```

3. Clone this repo to `~/.dotfiles` with:

   ```zsh
   git clone git@github.com:ToddSmithSalter/dotfiles.git ~/.dotfiles
   ```

4. Run the installation with:

   ```zsh
   ~/.dotfiles/fresh.sh
   ```

5. After mackup is synced with your cloud storage, restore preferences by running `mackup restore`
6. Restart your computer to finalize the process

Your Mac is now ready to use!
