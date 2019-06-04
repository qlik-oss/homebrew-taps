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

## Bottling
To create a bottle you have to run the following two commands:

```
brew install <formula> --build-bottle
brew bottle <formula-name>
```

where `<formula>` can be the path to a formula or the name of one, e.g. [qlik-corectl.rb](Formula/qlik-corectl.rb) and `<formula-name>`
is the name the formula is installed as. In this example it would be `qlik-corectl`.
Running the second command will create a bottle for the architecture it was created on in the form of a `.tar.gz` file.

We can put our bottles in [bottles](bottles). This is not an ideal solution
as new bottles will be added for each release and we might want to look into
either purging the repo of old bottles or hosting them on bintray or something.
