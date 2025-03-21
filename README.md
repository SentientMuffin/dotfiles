1. Installation
   - brew: https://brew.sh
   - git: `brew install git`
   - tmux: `brew install tmux`
   - neovim: `brew install neovim`
   - stow: `brew install stow`
   - fzf: `brew install fzf bat ripgrep the_silver_searcher perl universal-ctags`
   - yazi: `brew install yazi ffmpeg sevenzip jq poppler fd ripgrep fzf zoxide imagemagick font-symbols-only-nerd-font`
   - fonts, download and install: https://www.jetbrains.com/lp/mono/

   # install lsp servers
   - lua: `brew install lua-language-server`

2. Clone config repo: `git clone git@github.com:SentientMuffin/dotfiles.git`
   - SSH key setup: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
     - Generate ssh key: `ssh-keygen -t ed25519 -C "powell.lin.cs@gmail.com"`
     - Ensure ssh-agent is running: `eval "$(ssh-agent -s)"`
     - Create config file (re-touch is fine): `touch ~/.ssh/config`
     - Update contents of file:
       ```
         Host github.com
           AddKeysToAgent yes
           UseKeychain no
           IdentityFile ~/.ssh/id_ed25519
       ```
     - Add ssh key to ssh-agent: `ssh-add --apple-use-keychain ~/.ssh/id_ed25519`
     - Add the SSH public key to your account on GitHub: https://github.com/settings/ssh/new

