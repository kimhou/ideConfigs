echo "start git pull";
git pull origin master
echo "git pull complete";

version=$1;
if[ "${version}x" == "x" ]; then
version=15;
fi

date=`date "+%Y%m%d_%H%M%S"`
preferenceDir="$HOME/Library/Preferences/IntelliJIdea${version}";
preferenceBackDir="${preferenceDir}_back_${date}";
pluginDir="$HOME/Library/Application Support/IntelliJIdea${version}";
pluginBackDir="${pluginDir}_back_${date}";
gitPreferenceDir="./${version}/preferences";
gitPluginDir="./${version}/plugins";

echo "start";

if [ ! -d ${preferenceDir} ]; then
mkdir ${preferenceDir};
fi

echo "start copy preferences";

mkdir ${preferenceBackDir}
sudo mv -f "${preferenceDir}"/* "${preferenceBackDir}"/;
if [ -f "${preferenceBackDir}"/idea${version}.key ]; then
sudo cp -r -f "${preferenceBackDir}"/idea${version}.key "${preferenceDir}"/
fi
sudo cp -r -f "${gitPreferenceDir}"/* "${preferenceDir}"/;
sudo chown -R `whoami` "${preferenceDir}"/*;

echo "preferences copy complete";

echo "start copy plugins"

if [ ! -d "${pluginDir}" ]; then
mkdir "${pluginDir}";
fi

mkdir "${pluginBackDir}";
sudo mv -f "${pluginDir}"/* "${pluginBackDir}"/;
sudo cp -r -f "${gitPluginDir}"/* "${pluginDir}"/;
sudo chown -R `whoami` "${pluginDir}"/*;

echo "plugins copy complete"

echo "##############PULL FROM GIT COMPLITE##################"


