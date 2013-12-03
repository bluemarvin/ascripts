
export ANDROID_ROOT=$HOME/android-ics-idk/mydroid
export ANDROID_PRODUCT=tate  
export ANDROID_API_LEVEL=14
export ANDROID_NDK_ROOT=$HOME/android-ndk-r7
export ANDROID_SDK_ROOT=$HOME/android-sdk-linux
export ANDROID_TOOLCHAIN=$HOME/android-toolchain-eabi-64/bin
export USE_64BIT_TC=1
export USE_CCACHE=1
export PREBUILT_CCACHE_PATH=/usr/bin/ccache

export ORIG_PATH=$PATH
MY_PATH=$HOME/bin:$HOME/scripts:$ANDROID_ROOT/out/host/linux-x86/bin:$ANDROID_SDK_ROOT/tools

if [ -z "$PATH" ] ; then
   export PATH=$MY_PATH
else
   export PATH=$MY_PATH:$PATH
fi

#export GIT_PS1_SHOWDIRTYSTATE=true
#export GIT_PS1_SHOWUNTRACKEDFILES=true
#export GIT_PS1_SHOWSTASHSTATE=true

export PS1='\u@\h:\w$(__git_ps1 " [%s]")\n>> '

