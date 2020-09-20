# CUE配置语言简介(幻灯片)

CUE是一种Go语言实现的开源数据约束语言，它是JSON的超集，是一种功能强大的配置语言。

**在线浏览幻灯片:**

- https://talks.godoc.org/github.com/chai2010/awesome-cue-zh/talks/chai2010-cue-intro-talk/cue-intro.slide

**本地启动幻灯片方式:**

1. 安装 present 工具: `go get golang.org/x/tools/cmd/present`
2. `make` 启动服务, 浏览器打开 http://127.0.0.1:3999
3. `make html`导出html静态文件到 `_talk_html_` 目录

## CUE语言简单入门

安装CUE命令(Go语言项目安装方式):

```
$ go get cuelang.org/go/cmd/cue
```

创建`hello.cue`文件：

```yaml
one: 1
two: 2

// A field using quotes.
"two-and-a-half": 2.5

list: [
	1,
	2,
	3,
]
```

转化为JOSN格式：

```json
$ go run main.go export --out=json hello.cue 
{
    "list": [
        1,
        2,
        3
    ],
    "one": 1,
    "two": 2,
    "two-and-a-half": 2.5
}
```

转化为YAML格式：

```yaml
$ go run main.go export --out=yaml hello.cue 
list:
- 1
- 2
- 3
one: 1
two: 2
two-and-a-half: 2.5
```

执行脚本(以下的格式化对齐是否有问题？)：

```
$ go run main.go eval hello.cue 
list: [1, 2, 3]
one:              1
two:              2
"two-and-a-half": 2.5
```


## 参考资料

- https://cuelang.org/

