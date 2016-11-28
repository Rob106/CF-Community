GREEN='\033[0;32m'
LGREEN='\033[1;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color
echo -e "-=${GREEN}CakeFace Community VirtuaServer Setup${NC}=-"
echo "Welcome to setup... let it do it's thing and report any bugs!"
echo ""
sleep 3
echo -e "${LGREEN}Step 1: Download BuildTools${NC}"
mkdir BuildTools
cd BuildTools
wget "https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"

echo -e "${LGREEN}Step 2: Run BuildTools${NC}"
echo -e "${RED}!THIS MAY TAKE A WHILE!${NC}"
#Get ready to run it...

# Work out the JAVA version we are working with:
JAVA_VER_MAJOR=""
JAVA_VER_MINOR=""
JAVA_VER_BUILD=""

# Based on: http://stackoverflow.com/a/32026447
for token in $(java -version 2>&1 | grep -i version)
do
    if [[ $token =~ \"([[:digit:]])\.([[:digit:]])\.(.*)\" ]]
    then
        JAVA_VER_MAJOR=${BASH_REMATCH[1]}
        JAVA_VER_MINOR=${BASH_REMATCH[2]}
        JAVA_VER_BUILD=${BASH_REMATCH[3]}
        break
    fi
done
if [ "$JAVA_VER_MAJOR" != "" ]
	then
		echo -e "Your Java Version is ${JAVA_VER_MAJOR}.${JAVA_VER_MINOR}"
	else
		echo -e "${RED}Your Java version could not be found... this will probably won't work{NC}"
fi

java -jar "BuildTools.jar" --rev 1.11

echo -e "${LGREEN}Step 3: Move to correct directories${NC}"

cd ..
cp "BuildTools/Spigot/Spigot-Server/target/spigot-1.11-R0.1-SNAPSHOT.jar" "VirtuaServer/spigot.jar"
cd VirtuaServer
read -p "If you agree to the Minecraft EULA, press enter."
echo "eula=true" > eula.txt

read -p "Finished... press enter/return to continue"