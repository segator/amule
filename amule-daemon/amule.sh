#!/bin/sh
AMULE_HOME=/amule/.aMule
AMULE_CONF=${AMULE_HOME}/amule.conf
mkdir -p ${AMULE_HOME}
AMULE_PWD=$(echo -n "${AMULE_PWD}" | md5sum | cut -d ' ' -f 1)
cat > ${AMULE_CONF} <<- EOM
[eMule]
AppVersion=2.3.1
Nick=http://www.aMule.org
QueueSizePref=50
MaxUpload=0
MaxDownload=0
SlotAllocation=2
Port=${AMULE_PORT}
UDPPort=${AMULE_PORT}
UDPEnable=1
Address=
Autoconnect=1
MaxSourcesPerFile=${AMULE_MAX_SOURCES_FILE}
MaxConnections=${AMULE_MAX_CONNECTIONS}
MaxConnectionsPerFiveSeconds=20
RemoveDeadServer=1
DeadServerRetry=9
ServerKeepAliveTimeout=0
Reconnect=1
Scoresystem=1
Serverlist=0
AddServerListFromServer=0
AddServerListFromClient=0
SafeServerConnect=0
AutoConnectStaticOnly=0
UPnPEnabled=0
UPnPTCPPort=50000
SmartIdCheck=1
ConnectToKad=1
ConnectToED2K=1
TempDir=${AMULE_TEMP}
IncomingDir=${AMULE_INCOMING}
ICH=1
AICHTrust=0
CheckDiskspace=1
MinFreeDiskSpace=1
AddNewFilesPaused=0
PreviewPrio=0
ManualHighPrio=0
StartNextFile=0
StartNextFileSameCat=0
StartNextFileAlpha=0
FileBufferSizePref=16
DAPPref=1
UAPPref=1
AllocateFullFile=0
OSDirectory=${AMULE_HOME}
OnlineSignature=0
OnlineSignatureUpdate=5
EnableTrayIcon=0
MinToTray=0
ConfirmExit=1
StartupMinimized=0
3DDepth=10
ToolTipDelay=1
ShowOverhead=0
ShowInfoOnCatTabs=1
VerticalToolbar=0
GeoIPEnabled=1
ShowVersionOnTitle=0
VideoPlayer=
StatGraphsInterval=3
statsInterval=30
DownloadCapacity=${AMULE_DOWNLOAD_CAPACITY}
UploadCapacity=${AMULE_UPLOAD_CAPACITY}
StatsAverageMinutes=5
VariousStatisticsMaxValue=100
SeeShare=2
FilterLanIPs=1
ParanoidFiltering=1
IPFilterAutoLoad=1
IPFilterURL=http://ip-filter.emulefuture.de/download.php?file=ipfilter.dat
FilterLevel=127
IPFilterSystem=0
FilterMessages=1
FilterAllMessages=0
MessagesFromFriendsOnly=0
MessageFromValidSourcesOnly=1
FilterWordMessages=0
MessageFilter=
ShowMessagesInLog=1
FilterComments=0
CommentFilter=
ShareHiddenFiles=0
AutoSortDownloads=0
NewVersionCheck=0
AdvancedSpamFilter=1
MessageUseCaptchas=1
Language=
SplitterbarPosition=75
YourHostname=
DateTimeFormat=%A, %x, %X
AllcatType=0
ShowAllNotCats=0
SmartIdState=0
DropSlowSources=0
KadNodesUrl=http://upd.emule-security.org/nodes.dat
Ed2kServersUrl=http://gruk.org/server.met.gz
ShowRatesOnTitle=0
GeoLiteCountryUpdateUrl=http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz
StatsServerName=Shorty's ED2K stats
StatsServerURL=http://ed2k.shortypower.dyndns.org/?hash=
[Browser]
OpenPageInTab=1
CustomBrowserString=
[Proxy]
ProxyEnableProxy=0
ProxyType=0
ProxyName=
ProxyPort=1080
ProxyEnablePassword=0
ProxyUser=
ProxyPassword=
[ExternalConnect]
UseSrcSeeds=0
AcceptExternalConnections=1
ECAddress=
ECPort=${AMULE_DAEMON_PORT}
ECPassword=${AMULE_PWD}
UPnPECEnabled=0
ShowProgressBar=1
ShowPercent=1
UseSecIdent=1
IpFilterClients=1
IpFilterServers=1
TransmitOnlyUploadingClients=0
[WebServer]
Enabled=1
Password=${AMULE_PWD}
PasswordLow=
Port=${AMULE_WEB_PORT}
WebUPnPTCPPort=50001
UPnPWebServerEnabled=0
UseGzip=1
UseLowRightsUser=0
PageRefreshTime=120
Template=${AMULE_WEBUI_TEMPLATE}
Path=/app/amuleweb
[GUI]
HideOnClose=0
[Razor_Preferences]
FastED2KLinksHandler=1
[SkinGUIOptions]
Skin=
[Statistics]
MaxClientVersions=0
[Obfuscation]
IsClientCryptLayerSupported=1
IsCryptLayerRequested=1
IsClientCryptLayerRequired=0
CryptoPaddingLenght=254
CryptoKadUDPKey=338883508
[PowerManagement]
PreventSleepWhileDownloading=0
[UserEvents]
[UserEvents/DownloadCompleted]
CoreEnabled=0
CoreCommand=
GUIEnabled=0
GUICommand=
[UserEvents/NewChatSession]
CoreEnabled=0
CoreCommand=
GUIEnabled=0
GUICommand=
[UserEvents/OutOfDiskSpace]
CoreEnabled=0
CoreCommand=
GUIEnabled=0
GUICommand=
[UserEvents/ErrorOnCompletion]
CoreEnabled=0
CoreCommand=
GUIEnabled=0
GUICommand=
[HTTPDownload]
URL_1=
EOM
amuled -c ${AMULE_HOME} -o
