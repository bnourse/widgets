#What is it?
A zsh function that I wrote to help me maintain PR discipline when
collaborating on group projects at OCS.

##What does it do?
It creates a new branch, makes and pushes an initial (empty) commit, then immediately creates a PR between the new branch and master.

It also sets upstream for the new branch so that you can just use `git pull` or `git push` in the branch.

##Dependencies
1. [`oh-my-zsh`](https://github.com/robbyrussell/oh-my-zsh) for `$(current_branch)`.
2. [`hub`](https://hub.github.com/) to create a PR from command line.

##Usage
`gcobpr new-branch "message for initial commit and pr description"`

NOTE: Right now the argument handling isn't very robust. If you give it two arguments it will try to execute everything. I don't THINK this can get you in too much trouble, but beware.

##Execution Details
`gcobpr new-branch "message for initial commit and pr description"` will run the following commands in this order:

1. `git checkout -b new-branch`
1. `git commit --allow-empty -m "message for initial commit and pr description"`
1. `git push origin $1`
1. `hub pull-request -m "message for initial commit and pr description"`
1. `git branch --set-upstream-to=origin/$(current_branch)`

##Installation
1. Clone/copy the contents into `~/.oh-my-zsh/custom`. The file name and sub-folder structure shouldn't matter as long as the function winds up in a file with a `.zsh` extension.
2. Close and re-open your terminal or run `source ~/.zshrc`
