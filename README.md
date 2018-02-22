## 软件发布记录
### 版本2.0.2_20180125
 - 涉及raycom-web-support，raycom-devoops-war
 1. 增加自定义登陆和主页面地址，需要在raycom配置文件中配置

### 版本2.0.1_20171115

- 调整包组成，整体升级版本，各个包功能

 1. core：数据模型和springhold
 2. utils：系统非spring相关工具类
 3. common：非spring直接依赖的通用组件包
 4. context:包含系统内置业务规则的组件包（可以使用bean）
 5. web：web核心包，提供框架web相关的核心功能包
 6. web-support：类似context，基于web包的核心功能，提供一系列框架基础业务实现，包括授权，登陆，文件上上传组件等。
 7. components:框架业务组件
 8. base-config：基础配置文件
 9. devoops-war ：基于devoops实现的基础页面，包括角色，权限等
 10. devoops-static：基于devoops实现的静态文件。
 11. devoops-pom：基于devoops的配置文件
 12. parent-pom：框架的跟依赖 

