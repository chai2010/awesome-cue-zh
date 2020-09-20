
arg1: 1
arg2: "abc"
arg3: string
_arg4: "hidden"  // 输出时隐藏 // HL

{
	a: arg1      // 引用上下文的字段
	b: "\(arg2):" + "arg3" 
	arg3: "arg3" // string + "arg3" => "arg3" // HL
}
