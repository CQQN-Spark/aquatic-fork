#!/bin/bash

function display {

    #Clear Console
    echo -e "\033c"

    #Display MOTD
    echo "
    ==========================================================================            
    $(tput setaf 6) ▄▄▄        █████   █    ██  ▄▄▄     ▄▄▄█████▓ ██▓ ▄████▄   ███▄    █  ▒█████  ▓█████▄ ▓█████   ██████
    $(tput setaf 6)▒████▄    ▒██▓  ██▒ ██  ▓██▒▒████▄   ▓  ██▒ ▓▒▓██▒▒██▀ ▀█   ██ ▀█   █ ▒██▒  ██▒▒██▀ ██▌▓█   ▀ ▒██    ▒
    $(tput setaf 6)▒██  ▀█▄  ▒██▒  ██░▓██  ▒██░▒██  ▀█▄ ▒ ▓██░ ▒░▒██▒▒▓█    ▄ ▓██  ▀█ ██▒▒██░  ██▒░██   █▌▒███   ░ ▓██▄   
    $(tput setaf 6)░██▄▄▄▄██ ░██  █▀ ░▓▓█  ░██░░██▄▄▄▄██░ ▓██▓ ░ ░██░▒▓▓▄ ▄██▒▓██▒  ▐▌██▒▒██   ██░░▓█▄   ▌▒▓█  ▄   ▒   ██▒
    $(tput setaf 6) ▓█   ▓██▒░▒███▒█▄ ▒▒█████▓  ▓█   ▓██▒ ▒██▒ ░ ░██░▒ ▓███▀ ░▒██░   ▓██░░ ████▓▒░░▒████▓ ░▒████▒▒██████▒▒
    $(tput setaf 6) ▒▒   ▓▒█░░░ ▒▒░ ▒ ░▒▓▒ ▒ ▒  ▒▒   ▓▒█░ ▒ ░░   ░▓  ░ ░▒ ▒  ░░ ▒░   ▒ ▒ ░ ▒░▒░▒░  ▒▒▓  ▒ ░░ ▒░ ░▒ ▒▓▒ ▒ ░
    $(tput setaf 6)  ▒   ▒▒ ░ ░ ▒░  ░ ░░▒░ ░ ░   ▒   ▒▒ ░   ░     ▒ ░  ░  ▒   ░ ░░   ░ ▒░  ░ ▒ ▒░  ░ ▒  ▒  ░ ░  ░░ ░▒  ░ ░
    $(tput setaf 6)  ░   ▒      ░   ░  ░░░ ░ ░   ░   ▒    ░       ▒ ░░           ░   ░ ░ ░ ░ ░ ▒   ░ ░  ░    ░   ░  ░  ░  
    $(tput setaf 6)      ░  ░    ░       ░           ░  ░         ░  ░ ░               ░     ░ ░     ░       ░  ░      ░  
    $(tput setaf 6)                                                  ░                             ░                      
    ==========================================================================
    "  
}

function forceStuffs {
  # Forcing Default Server Icon.
  curl -O https://media.discordapp.net/attachments/919461094433644644/1005004318329544754/server-icon.png

  # Forcing MOTD.
  echo "motd=\u00a7fThis server is hosted on \u00a79aquaticnodes.host\u00a7r\n\u00a77You can change this MOTD in server.properties" >> server.properties
}

function launchJavaServer {
  # Using Aikars flags.
  java -Xms1024M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar server.jar nogui
}
FILE=eula.txt

# Currently this is still in development.

function optimizeJavaServer {
  # Decreasing view distance.
  echo "view-distance=6" >> server.properties

  # Slows down incremental chunk saving during the world save task
  # echo "max-auto-save-chunks-per-tick: 10" >> paper.yml
  
  # Optimize explosions.
  # echo "optimize-explosions: true" >> paper.yml
  
  # Disable overload warnings
  # echo "warn-on-overload: false" >> spigot.yml

  # Prevents players from entering an unloaded chunk (due to lag), which causes more lag.
  # echo "prevent-moving-into-unloaded-chunks: true" >> paper.yml
  
  # Worlds folder
  echo "world-container: worlds" >> bukkit.yml
  
}

# Check if the node IP is matched.
IP=$(curl -s https://checkip.amazonaws.com)
if [ ! "$IP" = 57.128.5.146 ]
then
    display
    echo "$(tput setaf 1)Looks Like You tried making a java server on asia servers lmao"
    exit
else 

if [ ! -f "$FILE" ]
then
    mkdir -p plugins
    display
echo "
  $(tput setaf 1)Modded By CQQN_Spark#8203
  $(tput setaf 2)Made By ewn#9981 & fate#0993
  $(tput setaf 3)What Server Software you goin to use
  1) Vanilla 1.19.2  |  5) Bukkit 1.19.2
  2) Paper 1.19.2    |  6) Bungeecord
  3) PurPur 1.19.2   |
  4) Spigot 1.19.2   |
  "
  echo "$(tput setaf 1)RESTART YOUR SERVER IF YOU HAVE A SERVER SOFTWARE ALREADY INSTALLED AND THIS APPEARED AGAIN."
  
read -r n

# I was uploading all the server jars to Discord because I was in hurry for vacation lol, will do a complete recode soon.
case $n in
  1) 
    sleep 1

    echo "$(tput setaf 3)Downloading 1.19.2 Vanilla..."

    sleep 4

    forceStuffs

    curl -O https://cdn.discordapp.com/attachments/1006691507434164244/1006694392465203400/server.jar

    display
    
    sleep 10
    
    echo -e ""
    
    optimizeJavaServer
    launchJavaServer
  ;;

  2) 
    sleep 1

    echo "$(tput setaf 3)Downloading 1.19.2 Paper..."

    sleep 4

    forceStuffs

    curl -O https://cdn.discordapp.com/attachments/1006684720303714415/1006697443733286972/server.jar

    display
    
    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  3) 
    sleep 1

    echo "$(tput setaf 3)Downloading 1.19.2 PurPur..."

    sleep 4

    forceStuffs

    curl -O https://cdn.discordapp.com/attachments/1006636629504577636/1006696015241433098/server.jar

    display
    
    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  4)
    sleep 1

    echo "$(tput setaf 3)Downloading 1.19.2 Spigot..."

    sleep 4

    forceStuffs

    curl -O https://cdn.discordapp.com/attachments/1006691603664097281/1006699806669942844/server.jar

    display

    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  5) 
    sleep 1

    echo "$(tput setaf 3)Downloading 1.19.2 bukkit..."

    sleep 4

    forceStuffs

    curl -O https://cdn.discordapp.com/attachments/1006691524911845437/1006702236363128955/server.jar

    display

    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  6)
    echo "$(tput setaf 3)Downloading latest Bungeecord..."

    curl -O https://cdn.discordapp.com/attachments/1006691560169152522/1006702994382934116/BungeeCord.jar

    display 

    java -Xms512M -Xmx512M -jar BungeeCord.jar
  ;;

  *) 
    echo "Invalid option, exiting.."
    exit
  ;;
esac  
else
if [ -f plugins ]; then
mkdir plugins
fi
if [ -f "BungeeCord.jar" ]; then
  display
  java -Xms512M -Xmx512M -jar BungeeCord.jar
fi
if [ ! -f hA5AW4Ni6Si6S4WvZ4WvZhA5AW4N.png ]; then
# Force the server icon.
curl -O https://media.discordapp.net/attachments/919461094433644644/1005004318329544754/server-icon.png
fi
if [ -d plugins ]; then
  mkdir -p plugins
fi
  display   
  launchJavaServer
fi
fi
