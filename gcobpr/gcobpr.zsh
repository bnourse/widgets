gcobpr () {
	if [[ $# -ne 2 ]]; then 
		echo Wrong number of arguments!
		echo usage: gcobpr new-branch \"message for initial commit and pr description\"
		return 1
	else
		git checkout -b $1
		git commit --allow-empty -m $2
		git push origin $1
		hub pull-request -m $2
		git branch --set-upstream-to=origin/$(current_branch)
	fi
}