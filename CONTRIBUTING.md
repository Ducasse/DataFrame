# How to contribute to DataFrame?
DataFrame is an [open source](https://en.wikipedia.org/wiki/Open-source_software) project developed in a collaborative public manner.
We need your help to make it better.
Every contribution counts - should it be a fixed typo in documentation or the implementation of a faster algorithm.
> There is no such thing as small contribution

1. [Working with issues](#working-with-issues)
2. [Setting up the environment](#setting-up-the-environment)
    1. [Download a fresh Pharo 6.1 image](#download-a-fresh-pharo-61-image)
    2. [Update Iceberg](#update-iceberg)
    3. [Connect to GitHub with SSH](#connect-to-github-with-ssh)
    4. [Settings](#settings)
    5. [Load DataFrame](#load-dataframe)
3. [Making changes to DataFrame](#making-changes-to-dataframe)

## Working with issues
The best way to find out how you can help make DataFrame better is to look at the [list of open issues](https://github.com/PolyMathOrg/DataFrame/issues). Pay attention to the labels on these issues. If you are new to Pharo or don't have a good understanding how DataFrame works inside - consider taking issues that are marked with [good first issue](https://github.com/PolyMathOrg/DataFrame/labels/good%20first%20issue) label. They can be easily resolved and don't require digging deep inside DataFrame. Issues that are marked with [bug](https://github.com/PolyMathOrg/DataFrame/labels/bug) label are the ones that need to be resolved as soon as possible. On the other hand, [enhancement](https://github.com/PolyMathOrg/DataFrame/labels/enhancement) issues are not so urgent, but working on them might be more interesting for you because you will be introducing new features to DataFrame.

If you decide to take a certain issue, please assign it to yoursef to let others know that someone is working on it. Once you've made a pull request (in the following sections we describe in details how to commit your changes and make pull requests), don't forget to describe your solution in a comment under the corresponding issue. If you are stuck and can't solve the problem, you can still leave a comment explaining what you tried and why it didn't work. It is also a valuable contribution that will be very useful for people who will be working on that issue later.

Should you encounter any problems with DataFrame while working on your selected issue, don't hesitate to open new ones. Just give it a meaningful title and try to describe the problem as clearly as possible.

## Setting up the environment
In order to make your conributions you need to set up the environment that will allow you to have a local version of DataFrame repository and push your changes directly from your Pharo image.

### Download a fresh Pharo 6.1 image
It is recommended to make your contributions using the fresh Pharo 6.1 image.
You can download it from the [official website](https://pharo.org/download).
Just follow the instructions for your OS.

### Update Iceberg
[Iceberg](https://github.com/pharo-vcs/iceberg) is a set of tools that allow one to handle git repositories directly from a Pharo image.
Since Pharo 6.0, iceberg is included in the image, so you don't need to install it.
However, there are some bugs that will produce an LGit error if you try to enable Metacello integration
(we will be doing it in the next steps).
According to the [instructions](https://github.com/pharo-vcs/iceberg#update-iceberg), you should update Iceberg on your new Pharo 6 image by executing this script in your Playground

```Smalltalk
MetacelloPharoPlatform select.
#(
  'BaselineOfTonel'
  'BaselineOfLibGit'
  'BaselineOfIceberg'
  'Iceberg-UI' 
  'Iceberg-Plugin-GitHub' 
  'Iceberg-Plugin' 
  'Iceberg-Metacello-Integration' 
  'Iceberg-Libgit-Tonel' 
  'Iceberg-Libgit-Filetree' 
  'Iceberg-Libgit' 
  'Iceberg' 
  'LibGit-Core'
  'MonticelloTonel-Tests'
  'MonticelloTonel-Core'
  'MonticelloTonel-FileSystem' ) 
do: [ :each | (each asPackageIfAbsent: [ nil ]) ifNotNil: #removeFromSystem ].
Metacello new
   baseline: 'Iceberg';
   repository: 'github://pharo-vcs/iceberg:v0.6.5';
   load.
```

Now Iceberg should be working correctly and you should get no errors while loading DataFrame.

### Connect to GitHub with SSH
Iceberg has a bug that makes it hard to work with HTTPS connections.
If you don't have SSH keys for connecting to GitHub follow [these instructions](https://help.github.com/articles/connecting-to-github-with-ssh/) to set them up.
Otherwise you can just continue to the next section.

### Settings
Make sure that "Enable Metacello Integration" is checked. Now you should also check "Use custom SSH keys".

![Enable Metacello Integration](docs/img/settings.jpg)

### Load DataFrame
Execute the following Metacello script in your Pharo playground. It will load all packages of DataFrame, including DataFrame-Core, DataFrame-Tools, and all the tests.

```Smalltalk
Metacello new
   baseline: 'DataFrame';
   repository: 'github://PolyMathOrg/DataFrame';
   load.
```
## Making changes to DataFrame
DataFrame consists of 4 packages:
* **DataFrame-Core**
* **DataFrame-Core-Tests**
* **DataFrame-Tools**
* **DataFrame-Tools-Tests**

Assuming that you loaded DataFrame using the script from the previous section, you should have the exact same packages in your image.

## Committing your changes
Open Iceberg from _World Menu > Iceberg_ or simply by pressing `Ctrl+O+I` (or `Cmd+O+I` on Mac). You will see the list of repositories. If you followed the instructions of the previous sections, you should see DataFrame in that list. If you made some changes, repository name will be highlighted with green.

![Iceberg Repositories](docs/img/iceberg-repos.jpg)

Double click on DataFrame in the list of repositories and and you will see the change log. Write a meaningful commit message and press **Commit onto master**.

![Iceberg Change Log](docs/img/iceberg-changes.jpg)

It is highly recommended to reference the issue that you were working on. To do that simply add anywhere in your message a `#` sign followed by the issue number. For example, to reference issue 7, you should write `#7`.

## Making a pull request
...
