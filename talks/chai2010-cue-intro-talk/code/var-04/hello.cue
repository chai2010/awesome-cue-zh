a: 3*[0]                   // 定义数组 [3]int{...} // HL
b: [for i, _ in a { i+1 }] // for迭代数组的下标 // HL
c: {
    for i, _ in 3*[0] { "\(i+1)": i+1 } // HL
}
