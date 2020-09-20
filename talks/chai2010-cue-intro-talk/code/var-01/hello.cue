let _name1 = "cue1" // HL

_name2: "cue2" // HL
_name2: string // HL

config: {
	name1: _name1 + ":aaa"
	name2: _name2 + ":bbb"
}

x: config.name1 // 嵌套路径的访问 // HL
