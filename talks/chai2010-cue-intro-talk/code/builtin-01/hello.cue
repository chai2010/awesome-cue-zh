a: len("abc")           // 3
b: len("世界")           // 6

c: len([1, 2, 3])       // 3
d: len([1, 2, ...])     // 2, >=2

e: and([true, true])    // true
g: and([])              // _, top 集合, 类似无穷大集合

h: or([true, false])    // a | b
h: or(true)             // or([true, false]) & or(true)

i: or([int, "abc"])     // a | b
j: or([])               // _|_, bottom 集合, 类似空集
