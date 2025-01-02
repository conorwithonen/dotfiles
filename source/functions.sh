# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}


# AWS - Get currently logged in aws account name
function aws-account() {
  aws iam list-account-aliases | jq ".AccountAliases[0]" -r
}

# AWS - follow log group for by function name
function aws-function-logs() {
	local functionName=$1
	aws logs tail /aws/lambda/$functionName --follow
}
# AWS - Get queue attributes
function aws-queue-attributes-dev() {
	local queue_url=$1
	aws sqs get-queue-attributes --queue-url $queue_url --attribute-names All | jq
}
# AWS - Get prod queue attributes
function aws-queue-attributes-prod() {
	local queue_url=$1
	aws sqs get-queue-attributes --profile=prod --queue-url $queue_url --attribute-names All | jq
}
# AWS - List images by repo name
function aws-list-images() {
	local repo_name=$1
	aws ecr list-images --repository-name $repo_name | jq '.imageIds[].imageTag'
}

# Docker - Open up Jupyter Lab container and open browser
function j-lab() {
	docker run --rm -d -p 8889:8888 \
	--name jlab \
	-v "$(pwd):/home/jovyan/work" jupyter/scipy-notebook start-notebook.py \
 	--NotebookApp.token="${JLD_PASSWORD}" &&\
	open "http://127.0.0.1:8889?token=${JLD_PASSWORD}"
}

# Creates new ed25519 ssh keys
# alias newkey="ssh-keygen -t ed25519 -b 4096 -C ${ssh_email} -N '' -f"
function newkey() {
	filename=$1
	type='ed25519'
	timestamp=$(date +%Y%m%d)
	if [[ -z $filename ]]; then
		filename="${type}_${timestamp}"
	fi
	if [[ -z $ssh_email ]]; then
			echo "No ssh email found. Please enter one for the comment on ${filename}"
			read ssh_email
	fi
	ssh-keygen -t $type -b 4096 -C "${ssh_email}" -N '' -f "${filename}";
}
