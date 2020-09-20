package main

import "tool/exec"

command: hello: {
    task:c: exec.Run & {
        $after: [task.a,task.b]
        cmd: "echo done"
    }

    task:a: exec.Run & {
        cmd: ["go", "version"]
        z: task.b.z
    }
    task:b: exec.Run & {
        cmd: "go env GOROOT"
        z: int
    }
}
