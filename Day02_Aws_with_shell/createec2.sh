#!/bin/bash
#This is a flag in shell script to show that we are handling error correctly.
set -euo pipefail

check_awscli() {
    if ! command -v aws &> /dev/null; then
        echo "AWS CLI is not installed. Please install it first." >&2
	return 1
    fi
}

install_awscli() {
    echo "Installing AWS CLI v2 on Linux..."

    # Download and install AWS CLI v2
    curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    sudo apt-get install -y unzip &> /dev/null
    unzip -q awscliv2.zip
    sudo ./aws/install

    # Verify installation
    aws --version

    # Clean up
    rm -rf awscliv2.zip ./aws
}

wait_for_instance() {
    local instance_id="$1"
    echo "Waiting for instance $instance_id to be in running state..."

#describe-instances is a command of aws cli
    while true; do
        state=$(aws ec2 describe-instances --instance-ids "$instance_id" --query 'Reservations[0].Instances[0].State.Name' --output text)
        if [[ "$state" == "running" ]]; then
            echo "Instance $instance_id is now running."
            break
        fi
        sleep 10 #checking after every 10 sec browser refresh to check running state came or not.
    done
}

create_ec2_instance() {
    local ami_id="$1"
    local instance_type="$2"
    local key_name="$3"
    local subnet_id="$4"
    local security_group_ids="$5"
    local instance_name="$6"

    # Run AWS CLI command to create EC2 instance
    instance_id=$(aws ec2 run-instances \
        --image-id "$ami_id" \
        --instance-type "$instance_type" \
        --key-name "$key_name" \
        --subnet-id "$subnet_id" \
        --security-group-ids "$security_group_ids" \
        --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instance_name}]" \
        --query 'Instances[0].InstanceId' \
        --output text
    )

    if [[ -z "$instance_id" ]]; then
        echo "Failed to create EC2 instance." >&2
        exit 1
    fi

    echo "Instance $instance_id created successfully."

    # Wait for the instance to be in running state
    wait_for_instance "$instance_id"
}

main() {

	#Checking if aws cli is installed or not
	
    check_awscli || install_awscli
    if ! check_awscli ; then
	    install_awscli || exit 1
    fi

    echo "Creating EC2 instance..."

    # Specify the parameters for creating the EC2 instance
    AMI_ID="ami-09040d770ffe2224f" #you can find this when you go to create instance tab and there under block where we select machines like ubuntu, redhat etc we find the ami id.
    INSTANCE_TYPE="t2.micro"
    KEY_NAME="Shell-scripting-for-devops"
    SUBNET_ID="subnet-0f319fceca8a05d17"
    SECURITY_GROUP_IDS="sg-0e249ac60009052a1"  # Add your security group IDs separated by space
    INSTANCE_NAME="Shell-Script-EC2-Demo"

    # Call the function to create the EC2 instance
    create_ec2_instance "$AMI_ID" "$INSTANCE_TYPE" "$KEY_NAME" "$SUBNET_ID" "$SECURITY_GROUP_IDS" "$INSTANCE_NAME"

    echo "EC2 instance creation completed."
}

#Here $@ means that there can be any number of arguments in main function np.
main "$@"


