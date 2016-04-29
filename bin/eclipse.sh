echo  ' Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.'
echo  ''
echo  ' Author: ThinkGem@163.com'

cd ..
set cd = '/home/bread/workspace'
mvn -Declipse.workspace=$cd eclipse:clean eclipse:eclipse
cd bin
