## 更新说明


### 版本2.0.0_20170926

- 子包raycom-common更新到2.0.0_20170926

  1.  类CacheUtils中增加removeAllCache()方法，用于移除对应cache内的所有缓存，适用于session缓存
### 版本2.0.0_20170918

- 子包raycom-context更新到2.0.0_20170918

  1.  邮件发送增加对ssl的支持，raycom.properties中增加email.isSSL属性，其值为true ，false。
对应包raycom-components

### 版本2.0.0_20170908
- 子包raycom-context更新到2.0.0_20170908

  1. SystemUser类增加获取userData中key值内容的API。

     ```java
     public Object getUserData(String key)
     ```
         
     ​

     ​