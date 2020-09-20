a: 10*[0]                             // 定义数组 // HL
b: [for i, _ in a { i+1 }]            // for迭代数组的下标 // HL
c: [for x in b if x mod 2 == 0 { x }]

// 合并
x: [
    for x in  [for i, _ in 10*[0] { i+1 }] if x mod 2 == 0 { x }

]

// 尝试生成阶乘和素数
// 生成 fib 数列
// 挖掘 for 和 if 的表达力
