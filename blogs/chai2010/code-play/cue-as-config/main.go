package main

import (
	"flag"
	"fmt"
	"log"
)

var (
	flagConfigPath = flag.String("conf", "config.cue", "Config file")
)

func main() {
	flag.Parse()

	if *flagConfigPath == "" {
		log.Fatal("empty conf pth")
	}

	cfg, err := getConfig(*flagConfigPath, nil)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Printf("%s: %+v\n", *flagConfigPath, cfg)
}
