# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
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

# Docker - Open up Jupyter Lab container and open browser
function j-lab() {
	docker run --rm -d -p 8889:8888 \
	--name jlab \
	-v "$(pwd):/home/jovyan/work" jupyter/scipy-notebook start-notebook.py \
 	--NotebookApp.token="${JLD_PASSWORD}" &&\
	open "http://127.0.0.1:8889?token=${JLD_PASSWORD}"
}
