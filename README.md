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

> 此种情况下，构建 msi 时会有一系列报错，但是不影响使用，大致分为两类，一种为`error LGHT0204 : ICE38: Component cmp717C970C8ED92815B4E9BCFF225BDE68 installs to user profile. It must use a registry key under HKCU as its KeyPath, not a file.`，一种为`error LGHT0204 : ICE64: The directory dirD1EE862D32218A041814016EC3D72FC5 is in the user profile but is not listed in the RemoveFile table.`，目前通过为`light.exe`指定参数`-sice:ICE38 -sice:ICE64`来隐藏他们的显示，如果自己配置时发现了存在莫名的错误，但是没有提示，可以尝试删除这些参数配置

1. 修改`Product-perUser.wxs`的`$applicationName`与`$startupProgramName`
2. 调用`.\build-perUser.ps1`生成`Product.msi`

## 记录 msi 安装日志
```
msiexec.exe /i "Product.msi" /l*v "log.log"
```