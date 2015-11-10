echo "git pull start";
git pull origin master
echo "git pull complete";
version=$1;
if [ "${version}x" = "x" ]; then
version=15;
fi

echo "start copy version ${version} config files";

preferenceDir="$HOME/Library/Preferences/IntelliJIdea${version}";
pluginDir="$HOME/Library/Application Support/IntelliJIdea${version}";
gitPreferenceDir="./${version}/preferences";
gitPluginDir="./${version}/plugins";

if [ -d "${preferenceDir}" ]; then
cp -r -f "${preferenceDir}"/* "${gitPreferenceDir}"/;
fi


if [ -d "${pluginDir}" ]; then
cp -r -f "${gitPluginDir}"/* "${pluginDir}"/;
fi

git add .
git commit -m 'update'
git push origin master
echo "##############PUSH TO  GIT COMPLITE##################"


