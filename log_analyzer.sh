#!/bin/bash

#TASK: Automate the task -  Analyze log files generated on different servers as a SA, identify specific events, and generate a summary report.


#Function to tell the usage of the script
function display_usage {
	echo "Usage: $0 <Enter the Path on the server where the log file is present>"
}

#Condition to check if user has passed the argument or not
if [ $# -eq 0 ] || [ ! -f "$1" ]; then
	echo "Please enter a valid argument"
	display_usage
	exit 1
fi

path_to_logfile=$1 #A variable passed while running the script to know the path of log file which needs to be analyzed

#1. Count total number of lines in Log File
total_lines=$(wc -l < "$path_to_logfile")

#2. Count the lines with word "ERROR" or "failed"
total_error_count=$(grep -Eic "error | failed" < "$path_to_logfile")

#3.Search for critical events (lines containing the keyword "CRITICAL") and store them in array
mapfile -t critical_events < <(grep -n -i "CRITICAL"  "$path_to_logfile")

#4. Identify the top 5 most common error messages and their occurrence count using associative arrays
declare -A error_messages #Syntax in Bash to declare assosiative arrays
while IFS= read -r line; do
    # Use awk to extract the error message (fields are space-separated)
    error_msg=$(awk '{for (i=3; i<=NF; i++) printf $i " "; print ""}' <<< "$line")
    ((error_messages["$error_msg"]++))
done < <(grep -i "ERROR" "$path_to_logfile")

# Sort the error messages by occurrence count (descending order)
sorted_error_messages=$(for key in "${!error_messages[@]}"; do
    echo "${error_messages[$key]} $key"
done | sort -rn | head -n 5)

#5. Generate the summary report in a separate file
summary_report="log_summary_$(date +%Y-%m-%d).txt"
{
    echo "Date of analysis: $(date)"
    echo "Log file: $path_to_logfile"
    echo "Total lines processed: $total_lines"
    echo "Total error count: $total_error_count"
    echo -e "\nTop 5 error messages:"
    echo "$sorted_error_messages"
    echo -e "\nCritical events with line numbers:"
    for event in "${critical_events[@]}"; do
        echo "$event"
    done
} > "$summary_report"

echo "Summary report generated: $summary_report"

