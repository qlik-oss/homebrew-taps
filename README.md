# 🍻 homebrew-taps

A repo to put things we want to distribute through brew.

To add a new formula, create one using the [cookbook](https://docs.brew.sh/Formula-Cookbook).
When you are finished just add it to the Formula folder and it will be available to all who
have the `qlik-oss/taps` tap installed tapped.

## Tapping the tap
To tap this tap just run
```
brew tap qlik-oss/taps
```
After the tap is tapped, you can easily install any formula present in this repo, e.g. corectl:
```
brew install qlik-corectl
```
And voilà! It is installed.
