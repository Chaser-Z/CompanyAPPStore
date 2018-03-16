
APPID=XXX
APPPS=XXXX
FIRTOKEM=XXX

#使用方法
#在项目的根目录创建一个IPADir文件夹，导入出的包会放在里面
if [ ! -d ./IPADir ];
then
mkdir -p IPADir;
fi

#工程绝对路径
project_path=$(cd `dirname $0`; pwd)

#工程名 将XXX替换成自己的工程名
project_name=CompanyAPPStore

#scheme名 将XXX替换成自己的sheme名
scheme_name=CompanyAPPStore

#打包模式 Debug/Release
development_mode=Release

#build文件夹路径
build_path=${project_path}/build

#plist文件所在路径
exportOptionsPlistPath=${project_path}/exportTest.plist

#导出.ipa文件所在路径
exportIpaPath=${project_path}/IPADir/${development_mode}


# 根据需求设置打包类型
echo "Place enter the number you want to export ? [ 1:app-store 2:ad-hoc] "

read number
while([[ $number != 1 ]] && [[ $number != 2 ]])
do
echo "Error! Should enter 1 or 2"
echo "Place enter the number you want to export ? [ 1:app-store 2:ad-hoc] "
read number
done

# 根据不同的选择读取不同的plist文件
if [ $number == 1 ];then
development_mode=Release
exportOptionsPlistPath=${project_path}/exportAppstore.plist
else
development_mode=Debug
exportOptionsPlistPath=${project_path}/exportTest.plist
fi


echo '///-----------'
echo '/// 正在清理工程'
echo '///-----------'
# 打包之前先clean一下，就如同在Xcode进行Product -> Clean。
xcodebuild \
clean -configuration ${development_mode} -quiet  || exit


echo '///--------'
echo '/// 清理完成'
echo '///--------'
echo ''

echo '///-----------'
echo '/// 正在编译工程:'${development_mode}
echo '///-----------'
# 开始编辑生成archive包
xcodebuild \
archive -workspace ${project_path}/${project_name}.xcworkspace \
-scheme ${scheme_name} \
-configuration ${development_mode} \
-archivePath ${build_path}/${project_name}.xcarchive  -quiet  || exit

echo '///--------'
echo '/// 编译完成'
echo '///--------'
echo ''

echo '///----------'
echo '/// 开始ipa打包'
echo '///----------'
# 通过archive包再导出ipa到指定路径
xcodebuild -exportArchive -archivePath ${build_path}/${project_name}.xcarchive \
-configuration ${development_mode} \
-exportPath ${exportIpaPath} \
-exportOptionsPlist ${exportOptionsPlistPath} \
-quiet || exit


if [ -e $exportIpaPath/$scheme_name.ipa ]; then
echo '///----------'
echo '/// ipa包已导出'
echo '///----------'
# 成功的话，打开文件夹
open $exportIpaPath
else
echo '///-------------'
echo '/// ipa包导出失败 '
echo '///-------------'
fi
echo '///------------'
echo '/// 打包ipa完成  '
echo '///-----------='
echo ''

echo '///-------------'
echo '/// 开始发布ipa包 '
echo '///-------------'


if [ $number == 1 ];then

#验证并上传到App Store
# 将-u 后面的XXX替换成自己的AppleID的账号，-p后面的XXX替换成自己的密码
altoolPath="/Applications/Xcode.app/Contents/Applications/Application Loader.app/Contents/Frameworks/ITunesSoftwareService.framework/Versions/A/Support/altool"
"$altoolPath" --validate-app -f ${exportIpaPath}/${scheme_name}.ipa -u $APPID -p $APPPS -t ios --output-format xml
"$altoolPath" --upload-app -f ${exportIpaPath}/${scheme_name}.ipa -u  $APPID -p $APPPS -t ios --output-format xml
else
#上传到Fir
# 将XXX替换成自己的Fir平台的token
fir login -T $FIRTOKEM
fir publish $exportIpaPath/$scheme_name.ipa
fi

echo '///-------------'
echo '/// 邮件发送中。。。。。。。。 '
echo '///-------------'


#上传or发布成功 发送邮件
python3 sendEmail.py "测试版本 iOS ${bundleShortVersion}(${bundleVersion})上传成功" "赶紧下载体验吧!https://www.pgyer.com/XXX"
#发送推送
python3 myjpush.py  "${bundleShortVersion}(${bundleVersion})上传成功" "${project_name}"

exit 0


