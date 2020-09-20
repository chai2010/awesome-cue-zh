package foo

import "tool/exec" // HL

city: "杭州"
who: *"World" | string @tag(who,type=string)

// Say hello!
command: hello: { // HL
    print: exec.Run & { // HL
        cmd: "echo Hello \(who)! Welcome to \(city)." // HL
    }
}
