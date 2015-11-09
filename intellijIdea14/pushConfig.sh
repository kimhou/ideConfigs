git pull origin master

preferenceDir="~/Library/Preferences/IntelliJIdea14";
pluginDir="~/Library/Application Support/IntelliJIdea14";
gitPreferenceDir="./preferencesAll";
gitPluginDir="./pluginAll";

if [ -d ${preferenceDir} ]; then
cp -r -f ${preferenceDir}/* ${gitPreferenceDir};
fi


if [ -d "${pluginDir}" ]; then
cp -r -f "${gitPluginDir}"/* "${pluginDir}";
fi

git add .
git commit -m 'update'
git push origin master
echo "##############PUSH TO  GIT COMPLITE##################"


