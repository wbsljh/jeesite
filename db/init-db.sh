echo ' * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.'
echo ' * Author: ThinkGem@163.com'
cd ..

mvn antrun:run -Pinit-db

cd db
pause
