package main

import "tool/cli"
import "tool/exec"
import "tool/file"

command: hello: {
    var: file: *"out.txt" | string @tag(file)

    ask: cli.Ask & { // HL
        prompt:   "What is your name?"
        response: string
    }
    echo: exec.Run & { // HL
        cmd:    ["echo", "Hello", ask.response + "!"]
        stdout: string // capture stdout
    }
    append: file.Append & { // HL
        filename: var.file
        contents: echo.stdout
    }
    print: cli.Print & { // HL
        text: echo.stdout
    }
}