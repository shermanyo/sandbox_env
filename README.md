sandbox_env
===========

dotfiles and scripts for setting up my sandbox environment  
  
  
In general, I start from a clean Ubuntu 14.04 (x64) Server install with OpenSSH Server.  
Next I either source a copy of __sandbox_env/base_environment/install_script.sh__ or run:

    export SANDBOX_ENV_ROOT=~/git_clones/sandbox_env
    echo export SANDBOX_ENV_ROOT=$SANDBOX_ENV_ROOT >> ~/.profile
    
    mkdir -p $SANDBOX_ENV_ROOT
    
    sudo apt-get -y install git
    git clone http://github.com/shermanyo/sandbox_env $SANDBOX_ENV_ROOT
    
    # run the install script:
    bash $SANDBOX_ENV_ROOT/base_environment/install_script.sh -desktop

This sets up my shell, vim and perl environments, and installs awesome if -desktop is specified.
