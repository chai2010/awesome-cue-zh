
acmeMonitoring: {
    name: string
    age: int
}

jobs: [a=string]: acmeMonitoring & {
    name: a
}

jobs: {
    foo: {  }
    bar: {  }
    baz: {  }
}

// 遍历字段的名字
for k, _ in jobs {
    jobs: "\(k)": age: 1
}