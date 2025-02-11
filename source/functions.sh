# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

# Check expiration of certificate
function check-cert() {
  local DOMAIN=$1
  echo | openssl s_client -servername $DOMAIN -connect $DOMAIN:443 2> /dev/null | openssl x509 -noout -dates
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
function aws-queue-attributes() {
	local queue_url=$1
	aws sqs get-queue-attributes --queue-url $queue_url --attribute-names All | jq
}
# AWS - List images by repo name
function aws-list-images() {
	local repo_name=$1
	aws ecr list-images --repository-name $repo_name | jq '.imageIds[].imageTag'
}
# AWS - List instances
function aws-list-instances() {
  aws ec2 describe-instances \
    --query "Reservations[*].Instances[*].[InstanceId, Tags[?Key=='Name'].Value | [0], PrivateIpAddress]" \
    --output table
}
# AWS - Describe instance by id
function aws-describe-image() {
	local instance_id=$1
	aws ec2 describe-instances --instance-ids $instance_id | jq
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

# Git - log with file and/or number argument
function gl() {

  oneline_flag=""
  number_of_commits="" 

  if [[ $# -eq 0 ]]; then
    echo "Usage: gl [number_of_commits] [file_path]"
    return 0
  fi
  # Oneline flag
  if [[ "$1" =~ "--oneline" ]]; then
    oneline_flag="--oneline"
    shift
  fi
  # Commit numbers
  if [[ "$1" =~ ^[0-9]+$ ]]; then
    number_of_commits=$1
    shift
  fi
  
  if [[ -z "$number_of_commits" ]]; then
    git log $oneline_flag -- "$@"
  else
    git log $oneline_flag -n "$number_of_commits" -- "$@"
  fi
}

# Git - log with file and/or number argument
function glo() {
  gl --oneline "$@"
}

