echo "start git pull";
git pull origin master
echo "git pull complete";

date=`date "+%Y%m%d_%H%M%S"`
preferenceDir="$HOME/Library/Preferences/IntelliJIdea14";
preferenceBackDir="${preferenceDir}_back_${date}";
pluginDir="$HOME/Library/Application Support/IntelliJIdea14";
pluginBackDir="${pluginDir}_back_${date}";
gitPreferenceDir="./preferences";
gitPluginDir="./plugins";

echo "start";

if [ ! -d ${preferenceDir} ]; then
mkdir ${preferenceDir};
fi

echo "start copy preferences";

mkdir ${preferenceBackDir}
sudo mv -f "${preferenceDir}"/* "${preferenceBackDir}"/;
if [ -f "${preferenceBackDir}"/idea14.key ]; then
sudo cp -r -f "${preferenceBackDir}"/idea14.key "${preferenceDir}"/
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


