构建一个pkg，用于import

cue.mod/module.cue 文件表示当前目录是一个模块

module.cue 文件指定了当前目录对应的模块路径，当前的子包都是相对于这个路径

每个目录下，package必须指定名字才能被其他文件import，默认选择的是和目录同名的。

第三方的模块 在 cue.mod/pkg 目录下

cue.mod/gen 第三方模块生成的文件

cue.mod/usr 用户定义的约束（？）

----

和Go的差别

1. package 语句是可选的，如果缺少则不能被其他包导入
2. 被导入包通过路径和名字唯一定位，比如 "hello.com/abc:abc"，冒号之后的是包名字，如果包名和目录名一样可以省略。
3. 一个目录下可以有多个不同名字的包
4. 同一个模块下，同一个名字的文件属于同一个包（不区分目录路径吗？）
5. 当前目录对应包包包含目录下的全部文件，和到模块根目录下所有的cue文件？？？？

包的实例是包的子集，是不是当前目录到模块跟木块？

当导入的路径匹配搭配多个目录时，cue.mod/pkg, cue.mod/gen, and cue.mod/usr 会合并到一个路径。

需要从网上cue get 一个模块测试


The package clause is optional: such files do not belong to a package and cannot be imported.

A package is identified by its import path and its package name, separated by a :. If its name is equal to the base of this path it may be omitted.

There can be more than one package per directory.

All files within a module with the same package name belong to the same package; an instance of such a package for a given directory contains all its files from that directory up till the module root.