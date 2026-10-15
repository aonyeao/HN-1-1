# INDEPENDENT FRAME · GitHub Pages 部署版

默认入口 index.html；电脑端入口 desktop.html；手机端入口 mobile.html。所有入口均响应式适配，视频按实际屏宽选择版本，无需跳转。

## 上传

将本目录内文件与 assets 文件夹一起上传到 GitHub 仓库根目录。不要上传外层文件夹或只上传 ZIP。Settings → Pages → Deploy from a branch → main → / (root)。保留 .nojekyll。所有文件名及资源路径均为英文、相对路径。

GitHub 网页上传的25MB限制针对单个文件，不是网站总大小。部署包总大小会超过25MB，解压后上传即可；本目录最大文件约18.43MB。较大批次可分批上传，勿使用Git LFS托管Pages媒体。

## 视频

| 素材 | 电脑端 | 手机端 |
|---|---|---|
| 01 | H.264 / 1920×1080 / 30fps / 16.70MB | H.264 / 1280×720 / 30fps / 8.64MB |
| 02 | H.264 / 1080×1080 / 30fps / 18.43MB | H.264 / 1080×1080 / 30fps / 9.09MB |

保留两段完整影片与比例，默认静音，用户可开启声音。视频未自动播放，进入附近时加载元数据，点击后播放。浏览器原生控件提供进度、音量及全屏操作。

## 图片与交互

保留2200px原始展示图片，正文采用懒加载，首屏优先加载；写入固有尺寸降低布局跳动。大图支持左右切换、键盘及触摸滑动、加载提示与失败提示。关闭大图恢复触发按钮焦点。去除固定全屏噪点纹理及默认隐藏内容，降低手机绘制负担。系统字体，正文16px，手机标题随屏宽调整。

原目录 independent-frame-public 保留4K源视频，不用于上传。发布截图与未引用图片不包含在部署目录。

## 社交分享

三端已配置统一分享标题、简介、1200×630封面及600×600方形缩略图。正式GitHub Pages地址确定后，在本目录执行：

```powershell
./configure-share.ps1 -SiteUrl "https://username.github.io/repository/"
```

该命令将三个HTML的分享图片改为绝对HTTPS网址，并补充og:url和canonical；部署抓取器不一定能正确处理相对分享图地址。上传HTML和两张分享图片即可，ps1无需上传。

微信不会保证从普通外链的Open Graph标签生成完整分享卡片。稳定自定义微信卡片通常需要认证公众号/合适的JS-SDK权限、配置JS接口安全域名和签名后端，使用updateAppMessageShareData与updateTimelineShareData。公众号AppSecret不得放在静态网页；GitHub Pages本身不能安全生成签名。正式网址配置完成后仍需在真实微信客户端验证。

## 验证

在本机Chrome的320/390/430/1440px宽度下检查：无横向溢出、标题无裁字、无破图、无脚本错误；图片开关和切换通过；四份视频实际解码通过。未对真实iOS Safari或公网速度作实机测试，公网加载速度仍由网络及GitHub Pages服务决定。
