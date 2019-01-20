[MySQL 官方Docker镜像的使用](https://itbilu.com/linux/docker/EyP7QP86M.html)  
[docker官方mysql镜像自定义配置](https://segmentfault.com/a/1190000016866792)  
[Docker中运行 MySQL ](http://einverne.github.io/post/2018/02/docker-mysql.html)   
[docker mysql镜像忽略表名大小写](https://blog.csdn.net/k21325/article/details/70195831)  
[Mysql初始化root密码和允许远程访问](https://www.cnblogs.com/cnblogsfans/archive/2009/09/21/1570942.html)  
[docker部署mysql](https://www.jianshu.com/p/0f4eee2cc56c)  
[使用docker运行mysql实例](https://www.jianshu.com/u/938eda01bfd9)  

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
flush privileges;


GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.168.33.244' IDENTIFIED BY 'root' WITH GRANT OPTION;