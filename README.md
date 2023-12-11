# WiX v3 基础使用

## 使用方式

### 前置

1. 在项目根目录下创建`SourceDir`目录，将要打包的应用程序资源复制到该目录下
2. 调用`.\project-files-generate.ps1`生成`Application.wxs`

### 执行

> `$applicationName`: 应用程序名称

> `$startupProgramName`: 启动程序名称

#### perMachine (默认安装目录为`C:\Program Files`，需要管理员权限)

1. 修改`Product-perMachine.wxs`的`$applicationName`与`$startupProgramName`
2. 调用`.\build-perMachine.ps1`生成`Product.msi`

#### perUser (默认安装目录为`C:\Users\用户名\AppData\Local\Programs`，不需要管理员权限)

1. 修改`Product-perUser.wxs`的`$applicationName`与`$startupProgramName`
2. 调用`.\build-perUser.ps1`生成`Product.msi`
