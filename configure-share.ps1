param([Parameter(Mandatory=$true)][string]$SiteUrl)
$ErrorActionPreference='Stop'
$uri=[uri]$SiteUrl
if($uri.Scheme -ne 'https' -or -not $uri.Host){throw '请输入正式的HTTPS网站根地址，例如 https://username.github.io/repository/'}
$base=$SiteUrl.TrimEnd('/')+'/'
foreach($name in @('index.html','desktop.html','mobile.html')){
 $path=Join-Path $PSScriptRoot $name
 $html=Get-Content -LiteralPath $path -Raw -Encoding UTF8
 $html=[regex]::Replace($html,'(<meta (?:property="og:image"|name="twitter:image") content=")[^"]+(" />)',{param($m)$m.Groups[1].Value+$base+'assets/share-cover.jpg'+$m.Groups[2].Value})
 $html=[regex]::Replace($html,'(<link rel="image_src" href=")[^"]+(" />)',{param($m)$m.Groups[1].Value+$base+'assets/share-square.jpg'+$m.Groups[2].Value})
 $html=[regex]::Replace($html,'s*<meta property="og:url" content="[^"]*" />','')
 $html=[regex]::Replace($html,'s*<link rel="canonical" href="[^"]*" />','')
 $url=if($name -eq 'index.html'){$base}else{$base+$name}
 $html=$html.Replace('</head>',('  <meta property="og:url" content="'+$url+'" />'+[Environment]::NewLine+'  <link rel="canonical" href="'+$url+'" />'+[Environment]::NewLine+'</head>'))
 Set-Content -LiteralPath $path -Value $html -Encoding UTF8
}
Write-Output '三个入口的分享图片绝对网址与页面规范地址已更新。请重新上传HTML。'
