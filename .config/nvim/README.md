My neovim configuration. Major credits to @ThePrimeagen, this config is built off of his 30 minute neovim tutorial. If you wish to use this configuration here is a list of pre-requisites:

1. Have packer installed https://github.com/wbthomason/packer.nvim
2. Have neovim 0.8 + installed


*NOTE*

As of right now, whenever this config is lauched into for the first time, or any time a new plugin is added either via git pull or on your own, you will
need to run ":PackerSync" in neovim so packer will grab the new plugin. Also keep in mind, LSP's are not plugins. They install to your actual system. The
":Mason" command is just a simple way to help install/remove these LSP's.
