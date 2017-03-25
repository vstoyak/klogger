#
# JAVA: path to JAVA (not JAVA_HOME, but the actual java command for running java)
#
JAVA=`which java`

#
# KLOGGER_USER: The user you want to run klogger as
#
KLOGGER_USER=vstoyak

BASEDIR=/Users/vstoyak/Documents/Development/klogger/target
CONFIGDIR="$BASEDIR"
LOGDIR="$BASEDIR"
PIDFILE="$BASEDIR/klogger.pid"
JMXPORT=9010
LOG4JPROPERTIES=$CONFIGDIR/log4j.properties
JAVA_OPTS=""
JAVA_OPTS="$JAVA_OPTS -server"

#
# Specify you desired heap size for the VM (corresponds to num.buffers in klogger.properties
#
JAVA_OPTS="$JAVA_OPTS -Xms150M -Xmx150M"

JAVA_OPTS="$JAVA_OPTS -XX:+UseParNewGC -XX:+UseConcMarkSweepGC"
JAVA_OPTS="$JAVA_OPTS -XX:+UseCMSInitiatingOccupancyOnly -XX:+CMSConcurrentMTEnabled -XX:+CMSScavengeBeforeRemark"
JAVA_OPTS="$JAVA_OPTS -XX:CMSInitiatingOccupancyFraction=80"
JAVA_OPTS="$JAVA_OPTS -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintTenuringDistribution"
JAVA_OPTS="$JAVA_OPTS -Xloggc:$LOGDIR/gc.log"
JAVA_OPTS="$JAVA_OPTS -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=10 -XX:GCLogFileSize=10M"
JAVA_OPTS="$JAVA_OPTS -Djava.awt.headless=true"
JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote"
JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.authenticate=false"
JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.ssl=false"
JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.port=$JMXPORT"
JAVA_OPTS="$JAVA_OPTS -Dlog4j.configuration=file:$LOG4JPROPERTIES"
JAVA_OPTS="$JAVA_OPTS -Djava.security.auth.login.config=$CONFIGDIR/jaas.conf"
JAVA_OPTS="$JAVA_OPTS -Djava.net.preferIPv4Stack=true"
JAVA_OPTS="$JAVA_OPTS -Djava.security.krb5.conf=/etc/krb5.conf"

CLASSPATH="$CONFIGDIR:$BASEDIR/lib/*"
