git pull origin master

date=`date "+%Y%m%d_%H%M%S"`
preferenceDir="/Users/tencent/Library/Preferences/IntelliJIdea14";
preferenceBackDir="${preferenceDir}_back_${date}";
pluginDir="/Users/tencent/Library/Application Support/IntelliJIdea14";
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
cp -r -f ${gitPreferenceDir}/* ${preferenceDir};

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


