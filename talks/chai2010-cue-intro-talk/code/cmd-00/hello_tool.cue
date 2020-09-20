package main

import "tool/cli" // HL

command: hello: { // HL
    print: cli.Print & {
        text: "Hello CUE." // HL
    }
}
