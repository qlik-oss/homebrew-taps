// This package is used to patch release of private repositories, pulling the assets that
// should be used by brew into this repo. It is used for `qlik-cli`.
package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io"
	"io/ioutil"
	"net/http"
	"os"
	"strings"
)

const path = "./bin/qlik-cli/"

var token string
var repo string

type Release struct {
	AssetsURL string `json:"assets_url"`
	Tag       string `json:"tag_name"`
}

type Asset struct {
	URL  string `json:"url"`
	Name string `json"name"`
	Tag  string
}

func main() {
	token = os.Getenv("GITHUB_TOKEN")
	if token == "" {
		check(fmt.Errorf("GITHUB_TOKEN not set"))
	}
	repo = os.Getenv("REPO_API_URL")
	if repo == "" {
		check(fmt.Errorf("REPO_API_URL not set, should be 'https://api.github.com/repos/:org/:repo'"))
	}
	req, err := http.NewRequest("GET", repo+"/releases", nil)
	check(err)

	req.Header.Set("Authorization", "token "+token)

	body := call(req)
	b, err := ioutil.ReadAll(body)
	body.Close()
	check(err)

	releases := []*Release{}
	check(json.Unmarshal(b, &releases))
	for _, release := range releases {
		fmt.Fprintf(os.Stderr, "Found release %s: ", release.Tag)
		if !release.present() {
			fmt.Fprintln(os.Stderr, "not present")
			release.getAssets()
		} else {
			fmt.Fprintln(os.Stderr, "present")
		}
	}

	patchFormula()
}

func patchFormula() {
	fmt.Fprintln(os.Stderr, "Patching formula")
	formula := "./Formula/qlik-cli.rb"
	data, err := ioutil.ReadFile(formula)
	check(err)
	old := strings.Replace(repo, "api.", "", 1)
	old = strings.Replace(old, "/repos", "", 1)
	old += "/releases/download"
	new := []byte("https://raw.githubusercontent.com/qlik-oss/homebrew-taps/publish-experiments/bin/qlik-cli")
	data = bytes.Replace(data, []byte(old), new, -1)
	check(ioutil.WriteFile(formula, data, 0644))
}

func (r *Release) present() bool {
	fi, err := os.Stat(path + r.Tag)
	if err != nil {
		return false
	}
	return fi.IsDir()
}

func (r *Release) getAssets() {
	err := os.MkdirAll(path+r.Tag, 0755)
	check(err)
	req, err := http.NewRequest("GET", r.AssetsURL, nil)
	check(err)
	req.Header.Set("Authorization", "token "+token)
	body := call(req)
	b, err := ioutil.ReadAll(body)
	body.Close()
	check(err)

	assets := []*Asset{}
	check(json.Unmarshal(b, &assets))

	for _, asset := range assets {
		asset.Tag = r.Tag
		if strings.Contains(asset.Name, "Darwin") || strings.Contains(asset.Name, "Linux") {
			asset.download()
		}
	}
}

func (a *Asset) download() {
	fmt.Fprintf(os.Stderr, "Downloading (%s) %s\n", a.Tag, a.Name)
	req, err := http.NewRequest("GET", a.URL, nil)
	check(err)
	req.Header.Set("Authorization", "token "+token)
	req.Header.Set("Accept", "application/octet-stream")
	body := call(req)
	file, err := os.Create(path + a.Tag + "/" + a.Name)
	if err != nil {
		body.Close()
		check(err)
	}
	_, err = io.Copy(file, body)
	body.Close()
	check(err)
}

func call(req *http.Request) io.ReadCloser {
	res, err := http.DefaultClient.Do(req)
	check(err)
	if res.StatusCode != http.StatusOK {
		res.Body.Close()
		check(fmt.Errorf("Status: %s", res.Status))
	}
	return res.Body
}

func check(err error) {
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
}