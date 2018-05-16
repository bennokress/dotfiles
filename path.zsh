# Home Path Names
export ANDROID_HOME=$HOME/Library/Android/sdk
export JAVA_HOME="$(/usr/libexec/java_home)"
export NODE_HOME=$HOME/.node/bin
export NODE_MODULES_HOME=$HOME/node_modules/.bin
export RVM_HOME=$HOME/.rvm/bin

# Load custom commands first
export PATH="$DOTFILES/bin:$PATH"

# Then load local bin directories before anything else
export PATH="$PATH:/usr/local/bin:/usr/local/sbin"

# Then load Node everything else. Rule of thumb: project specific before global
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$NODE_MODULES_HOME"
export PATH="$PATH:$NODE_HOME"
export PATH="$PATH:$JAVA_HOME/bin"

# Make sure to load RVM last, because it manipulates the PATH automatically in the end
# → see info: https://rvm.io/rvm/install#troubleshooting-your-install
export PATH="$PATH:$RVM_HOME"
