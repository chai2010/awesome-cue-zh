package main

import "tool/exec"

command: hello: {
    task:a: exec.Run & {
        cmd: ["go", "version"]
        z: task.c.z
    }
    task:b: exec.Run & {
        cmd: "go env GOROOT"
        z: task.a.z
    }
    task:c: exec.Run & {
        cmd: "go env GOPATH"
        z: int
    }
    task:d: exec.Run & {
        cmd: "echo done"
        $after: [task.a,task.b,task.c]
    }
}
