git pull origin master

date=`date "+%Y%m%d_%H%M%S"`
preferenceDir="$HOME/Library/Preferences/IntelliJIdea14";
preferenceBackDir="${preferenceDir}_back_${date}";
pluginDir="$HOME/Library/Application Support/IntelliJIdea14";
pluginBackDir="${pluginDir}_back_${date}";
gitPreferenceDir="./preferencesAll";
gitPluginDir="./pluginAll";

echo "start";

if [ ! -d ${preferenceDir} ]; then
mkdir ${preferenceDir};
fi

echo "start copy preferences";

mkdir ${preferenceBackDir}
mv -f "${preferenceDir}"/* "${preferenceBackDir}";
if [ -f "${preferenceBackDir}"/idea14.key ]; then
cp "${preferenceBackDir}"/idea14.key "${preferenceDir}"/
fi
cp -r -f "${gitPreferenceDir}"/* "${preferenceDir}"/;

echo "preferences copy complete";

echo "start copy plugins"

if [ ! -d "${pluginDir}" ]; then
mkdir "${pluginDir}";
fi

mkdir "${pluginBackDir}";
mv -f "${pluginDir}"/* "${pluginBackDir}";
cp -r -f "${gitPluginDir}"/* "${pluginDir}";
echo "plugins copy complete"

echo "##############PULL FROM GIT COMPLITE##################"


