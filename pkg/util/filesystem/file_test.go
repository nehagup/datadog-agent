// Unless explicitly stated otherwise all files in this repository are licensed
// under the Apache License Version 2.0.
// This product includes software developed at Datadog (https://www.datadoghq.com/).
// Copyright 2016-present Datadog, Inc.

package filesystem

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestCopyDir(t *testing.T) {
	assert := assert.New(t)
	src := t.TempDir()
	dst := t.TempDir()

	files := map[string]string{
		"a/b/c/d.txt": "d.txt",
		"e/f/g/h.txt": "h.txt",
		"i/j/k.txt":   "k.txt",
	}

	for file, content := range files {
		p := filepath.Join(src, file)
		err := os.MkdirAll(filepath.Dir(p), os.ModePerm)
		assert.NoError(err)
		err = os.WriteFile(p, []byte(content), os.ModePerm)
		assert.NoError(err)
	}
	err := CopyDir(src, dst)
	assert.NoError(err)

	for file, content := range files {
		p := filepath.Join(dst, file)
		actual, err := os.ReadFile(p)
		assert.NoError(err)
		assert.Equal(string(actual), content)
	}
}
