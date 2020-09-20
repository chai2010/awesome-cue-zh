package main

import (
	"fmt"
	"io/ioutil"
	"path/filepath"

	"cuelang.org/go/cue"
	"cuelang.org/go/encoding/gocode/gocodec"
	"cuelang.org/go/encoding/json"
	"cuelang.org/go/encoding/yaml"
)

const schema = `
port: uint16
logLevel:  "debug" | *"info" | "warn" | "error" | "critical"
`

type Config struct {
	Port     uint16 `json:"port"`
	LogLevel string `json:"logLevel"`
}

func getConfig(filePath string, data []byte) (p *Config, err error) {
	if data == nil {
		data, err = ioutil.ReadFile(*flagConfigPath)
		if err != nil {
			return nil, err
		}
	}

	var r cue.Runtime
	schemaInstance, err := r.Compile("schema", schema)
	if err != nil {
		panic(err)
	}

	var valueInstance *cue.Instance
	switch filepath.Ext(filePath) {
	case ".cue":
		valueInstance, err = r.Compile(filePath, data)
		if err != nil {
			return nil, fmt.Errorf("Parse CUE file error: %w", err)
		}
	case ".json":
		valueInstance, err = json.Decode(&r, filePath, data)
		if err != nil {
			return nil, fmt.Errorf("Parse JSON file error: %w", err)
		}
	case ".yml", ".yaml":
		valueInstance, err = yaml.Decode(&r, filePath, data)
		if err != nil {
			return nil, fmt.Errorf("Parse YAML file error: %w", err)
		}
	default:
		return nil, fmt.Errorf("file extension should be .cue, .json, .yaml or .yml, but %s", filepath.Ext(filePath))
	}

	merged := cue.Merge(schemaInstance, valueInstance)
	err = merged.Value().Validate()
	if err != nil {
		return nil, fmt.Errorf("Validation error: %w", err)
	}
	var config Config
	codec := gocodec.New(&r, &gocodec.Config{})
	err = codec.Encode(merged.Value(), &config)
	if err != nil {
		return nil, fmt.Errorf("Encode error: %w", err)
	}
	return &config, nil
}
