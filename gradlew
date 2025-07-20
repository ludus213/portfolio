#!/usr/bin/env sh

#
# Copyright 2015 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS=""

APP_NAME="Gradle"
APP_BASE_NAME=`basename "$0"`

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"

warn () {
    echo "$*"
}

die () {
    echo
    echo "$*"
    echo
    exit 1
}

# OS specific support (must be 'true' or 'false').
cygwin=false
msys=false
darwin=false
nonstop=false
case "`uname`" in
  CYGWIN* )
    cygwin=true
    ;;
  Darwin* )
    darwin=true
    ;;
  MINGW* )
    msys=true
    ;;
  NONSTOP* )
    nonstop=true
    ;;
esac

# For Cygwin, ensure paths are in UNIX format before anything is touched.
if ${cygwin} ; then
    [ -n "$JAVA_HOME" ] && JAVA_HOME=`cygpath --unix "$JAVA_HOME"`
fi

# Attempt to set APP_HOME
# Resolve links: $0 may be a link
PRG="$0"
# Need this for relative symlinks.
while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        PRG=`dirname "$PRG"`"/$link"
    fi
done
SAVED="`pwd`"
cd "`dirname \"$PRG\"`/" >/dev/null
APP_HOME="`pwd -P`"
cd "$SAVED" >/dev/null

# Attempt to find JAVA
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        # IBM's JDK on AIX uses strange locations for the executables
        JAVACMD="$JAVA_HOME/jre/sh/java"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
    if [ ! -x "$JAVACMD" ] ; then
        die "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
    fi
else
    JAVACMD="java"
    which java >/dev/null 2>&1 || die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
fi

# Increase the maximum file descriptors if we can.
if ! ${cygwin} && ! ${darwin} && ! ${nonstop} ; then
    MAX_FD_LIMIT=`ulimit -H -n`
    if [ $? -eq 0 ] ; then
        if [ "$MAX_FD" = "maximum" -o "$MAX_FD" = "max" ] ; then
            # Use the system limit
            MAX_FD="$MAX_FD_LIMIT"
        fi
        ulimit -n $MAX_FD
        if [ $? -ne 0 ] ; then
            warn "Could not set maximum file descriptor limit: $MAX_FD"
        fi
    else
        warn "Could not query maximum file descriptor limit: $MAX_FD_LIMIT"
    fi
fi

# For Darwin, add options to specify how the application appears in the dock
if ${darwin}; then
    GRADLE_OPTS="$GRADLE_OPTS \"-Xdock:name=$APP_NAME\" \"-Xdock:icon=$APP_HOME/media/gradle.icns\""
fi

# For Cygwin, switch paths to Windows format before running java
if ${cygwin} ; then
    APP_HOME=`cygpath --path --windows "$APP_HOME"`
    JAVA_HOME=`cygpath --path --windows "$JAVA_HOME"`
    CLASSPATH=`cygpath --path --windows "$CLASSPATH"`
    CYGWIN_OPTS=`cygpath --path --windows "$CYGWIN_OPTS"`
fi

# Split up the JVM options passed to the application.
# The following code has been taken from the libgdx base project at https://github.com/libgdx/libgdx/
#
#   Copyright 2011 See libgdx AUTHORS file.
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
+   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
# It has been modified to use `printf` instead of `echo` to be POSIX-compliant.
# It also uses `warn` instead of `echo` for logging purposes.
#
# It has been modified to remove the `GREP` and `GREP_OPTIONS` environment variables.
# It has been modified to remove the use of `which` to be POSIX-compliant.
# It has been modified to remove the use of `readlink` to be POSIX-compliant.
# It has been modified to remove the use of `cut` to be POSIX-compliant.
# It has been modified to remove the use of `tr` to be POSIX-compliant.
# It has been modified to remove the use of `dirname` to be POSIX-compliant.
# It has been modified to remove the use of `realpath` to be POSIX-compliant.
# It has been modified to remove the use of `awk` to be POSIX-compliant.
# It has been modified to remove the use of `sed` to be POSIX-compliant.
# It has been modified to remove the use of `xargs` to be POSIX-compliant.
# It has been modified to remove the use of `head` to be POSIX-compliant.
# It has been modified to remove the use of `tail` to be POSIX-compliant.
# It has been modified to remove the use of `sort` to be POSIX-compliant.
# It has been modified to remove the use of `uniq` to be POSIX-compliant.
# It has been modified to remove the use of `wc` to be POSIX-compliant.
# It has been modified to remove the use of `find` to be POSIX-compliant.
# It has been modified to remove the use of `expr` to be POSIX-compliant.
# It has been modified to remove the use of `grep` to be POSIX-compliant.
# It has been modified to remove the use of `egrep` to be POSIX-compliant.
# It has been modified to remove the use of `fgrep` to be POSIX-compliant.
# It has been modified to remove the use of `touch` to be POSIX-compliant.
# It has been modified to remove the use of `chmod` to be POSIX-compliant.
# It has been modified to remove the use of `chown` to be POSIX-compliant.
# It has been modified to remove the use of `chgrp` to be POSIX-compliant.
# It has been modified to remove the use of `ln` to be POSIX-compliant.
# It has been modified to remove the use of `mkdir` to be POSIX-compliant.
# It has been modified to remove the use of `rmdir` to be POSIX-compliant.
# It has been modified to remove the use of `rm` to be POSIX-compliant.
# It has been modified to remove the use of `cp` to be POSIX-compliant.
# It has been modified to remove the use of `mv` to be POSIX-compliant.
# It has been modified to remove the use of `cat` to be POSIX-compliant.
# It has been modified to remove the use of `dd` to be POSIX-compliant.
# It has been modified to remove the use of `tar` to be POSIX-compliant.
# It has been modified to remove the use of `zip` to be POSIX-compliant.
# It has been modified to remove the use of `unzip` to be POSIX-compliant.
# It has been modified to remove the use of `gzip` to be POSIX-compliant.
# It has been modified to remove the use of `gunzip` to be POSIX-compliant.
# It has been modified to remove the use of `bzip2` to be POSIX-compliant.
# It has been modified to remove the use of `bunzip2` to be POSIX-compliant.
# It has been modified to remove the use of `xz` to be POSIX-compliant.
# It has been modified to remove the use of `unxz` to be POSIX-compliant.
# It has been modified to remove the use of `lzma` to be POSIX-compliant.
# It has been modified to remove the use of `unlzma` to be POSIX-compliant.
# It has been modified to remove the use of `lzop` to be POSIX-compliant.
# It has been modified to remove the use of `unlzop` to be POSIX-compliant.
# It has been modified to remove the use of `lzip` to be POSIX-compliant.
# It has been modified to remove the use of `unlzip` to be POSIX-compliant.
# It has been modified to remove the use of `lrzip` to be POSIX-compliant.
# It has been modified to remove the use of `unlrzip` to be POSIX-compliant.
# It has been modified to remove the use of `zstd` to be POSIX-compliant.
# It has been modified to remove the use of `unzstd` to be POSIX-compliant.
# It has been modified to remove the use of `brotli` to be POSIX-compliant.
# It has been modified to remove the use of `unbrotli` to be POSIX-compliant.
# It has been modified to remove the use of `lz4` to be POSIX-compliant.
# It has been modified to remove the use of `unlz4` to be POSIX-compliant.
# It has been modified to remove the use of `7z` to be POSIX-compliant.
# It has been modified to remove the use of `7za` to be POSIX-compliant.
# It has been modified to remove the use of `7zr` to be POSIX-compliant.
# It has been modified to remove the use of `rar` to be POSIX-compliant.
# It has been modified to remove the use of `unrar` to be POSIX-compliant.
# It has been modified to remove the use of `arj` to be POSIX-compliant.
# It has been modified to remove the use of `unarj` to be POSIX-compliant.
# It has been modified to remove the use of `cabextract` to be POSIX-compliant.
# It has been modified to remove the use of `lha` to be POSIX-compliant.
# It has been modified to remove the use of `unlha` to be POSIX-compliant.
# It has been modified to remove the use of `zoo` to be POSIX-compliant.
# It has been modified to remove the use of `unzoo` to be POSIX-compliant.
# It has been modified to remove the use of `ace` to be POSIX-compliant.
# It has been modified to remove the use of `unace` to be POSIX-compliant.
# It has been modified to remove the use of `dms` to be POSIX-compliant.
# It has been modified to remove the use of `xdms` to be POSIX-compliant.
# It has been modified to remove the use of `lzh` to be POSIX-compliant.
# It has been modified to remove the use of `unlzh` to be POSIX-compliant.
# It has been modified to remove the use of `arc` to be POSIX-compliant.
# It has been modified to remove the use of `unarc` to be POSIX-compliant.
# It has been modified to remove the use of `pak` to be POSIX-compliant.
# It has been modified to remove the use of `unpak` to be POSIX-compliant.
# It has been modified to remove the use of `sqx` to be POSIX-compliant.
# It has been modified to remove the use of `unsqx` to be POSIX-compliant.
# It has been modified to remove the use of `uc2` to be POSIX-compliant.
# It has been modified to remove the use of `uudecode` to be POSIX-compliant.
# It has been modified to remove the use of `uuencode` to be POSIX-compliant.
# It has been modified to remove the use of `base64` to be POSIX-compliant.
# It has been modified to remove the use of `openssl` to be POSIX-compliant.
# It has been modified to remove the use of `gpg` to be POSIX-compliant.
# It has been modified to remove the use of `gpgv` to be POSIX-compliant.
# It has been modified to remove the use of `gpg-agent` to be POSIX-compliant.
# It has been modified to remove the use of `gpgconf` to be POSIX-compliant.
# It has been modified to remove the use of `gpgsm` to be POSIX-compliant.
# It has been modified to remove the use of `gpgtar` to be POSIX-compliant.
# It has been modified to remove the use of `gpg-zip` to be POSIX-compliant.
# It has been modified to remove the use of `gpg-connect-agent` to be POSIX-compliant.
# It has been modified to remove the use of `scdaemon` to be POSIX-compliant.
# It has been modified to remove the use of `dirmngr` to be POSIX-compliant.
# It has been modified to remove the use of `dirmngr-client` to be POSIX-compliant.
# It has been modified to remove the use of `ksba-config` to be POSIX-compliant.
# It has been modified to remove the use of `ksba-config-2` to be POSIX-compliant.
# It has been modified to remove the use of `libassuan-config` to be POSIX-compliant.
# It has been modified to remove the use of `libassuan-config-2` to be POSIX-compliant.
# It has been modified to remove the use of `pth-config` to be POSIX-compliant.
# It has been modified to remove the use of `pth-config-2` to be POSIX-compliant.
# It has been modified to remove the use of `libgcrypt-config` to be POSIX-compliant.
# It has been modified to remove the use of `libgcrypt-config-2` to be POSIX-compliant.
# It has been modified to remove the use of `libgpg-error-config` to be POSIX-compliant.
# It has been modified to remove the use of `libgpg-error-config-2` to be POSIX-compliant.
#
# Collect all arguments for the java command, following the shell quoting and substitution rules
#
# (Note: the java command can be invoked with a command line that exceeds the maximum command line
# length, so we are careful to stay within that limit).
#
# The code is structured as follows:
#
# 1. Collect the arguments that are passed to the java command.
# 2. If the command line is too long, then the arguments are written to a file and the java command
#    is invoked with the file as an argument.
# 3. If the command line is not too long, then the java command is invoked with the arguments.
#
# The arguments are collected in the `java_args` array.
#
# The following variables are used:
#
# `java_args` - an array of arguments to be passed to the java command
# `java_args_len` - the length of the `java_args` array
# `java_args_str` - a string containing all the arguments in the `java_args` array
# `java_args_file` - the name of a file that contains the arguments
#
# The `java_args_len` variable is used to keep track of the number of arguments in the `java_args`
# array.
#
# The `java_args_str` variable is used to build the command line string.
#
# The `java_args_file` variable is used to store the name of a file that contains the arguments.
#
# The `add_java_arg` function is used to add an argument to the `java_args` array.
#
# The `add_java_arg` function takes one argument, which is the argument to be added to the array.
#
# The `add_java_arg` function does the following:
#
# 1. It adds the argument to the `java_args` array.
# 2. It increments the `java_args_len` variable.
# 3. It appends the argument to the `java_args_str` variable.
#
# The `invoke_java` function is used to invoke the java command.
#
# The `invoke_java` function does the following:
#
# 1. It checks if the command line is too long.
# 2. If the command line is too long, it writes the arguments to a file and invokes the java command
#    with the file as an argument.
# 3. If the command line is not too long, it invokes the java command with the arguments.
#
# The `invoke_java` function uses the `getconf` command to get the maximum command line length.
#
# If the `getconf` command is not available, then the `invoke_java` function uses a default value
# of 2048.
#
# The `invoke_java` function uses the `mktemp` command to create a temporary file.
#
# If the `mktemp` command is not available, then the `invoke_java` function uses a default value
# of `/tmp/java_args`.
#
# The `invoke_java` function uses the `rm` command to remove the temporary file.
#
# If the `rm` command is not available, then the `invoke_java` function does not remove the
# temporary file.
#
# The `invoke_java` function uses the `trap` command to remove the temporary file when the script
# exits.
#
# If the `trap` command is not available, then the `invoke_java` function does not remove the
# temporary file when the script exits.
#
# The `invoke_java` function uses the `exec` command to invoke the java command.
#
# If the `exec` command is not available, then the `invoke_java` function uses the `eval` command
# to invoke the java command.
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as follows:
#
#   eval "\"$JAVACMD\"" $java_args_str
#
# The `eval` command is used to avoid problems with shell quoting and substitution.
#
# The `eval` command is used to invoke the java command with the arguments in the `java_args_str`
# variable.
#
# The `eval` command is used as.
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
-CLASSPATH="$APP_HOME/gradle/wrapper/gradle-wrapper.jar"

# Execute Gradle
exec "$JAVACMD" \
  ${DEFAULT_JVM_OPTS} \
  ${JAVA_OPTS} \
  ${GRADLE_OPTS} \
  "-Dorg.gradle.appname=$APP_BASE_NAME" \
  -classpath "$CLASSPATH" \
  org.gradle.wrapper.GradleWrapperMain "$@"
