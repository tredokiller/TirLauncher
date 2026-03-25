extends Node

const path_to_tracker = "Tracker.exe"
const path_to_game = "Tir.exe"

const path_to_updater = "TirUpdaterLauncher.exe"

const alternative_path_folder = "Game\\"

# Function to check if a program is running
func is_program_running(process_name: String) -> bool:
	var cmd = ""
	var args = PoolStringArray()
	var output = Array()
	var error = Array()
	
	if OS.get_name() == "Windows":
		cmd = "tasklist"  # Windows command to list running tasks
		args = []  # No additional arguments for tasklist
	elif OS.get_name() == "Linux" or OS.get_name() == "MacOS":
		cmd = "ps"  # Unix-based command to list running processes
		args = ["-A"]  # List all processes

	# Execute the command and check for the process name in the result
	var ret_code = OS.execute(cmd, args, true, output, false, false)  # Using correct OS.execute() signature
	
	if ret_code != OK:
		print("Error executing command.")
		return false

	# Check if the process name is found in the output
	for line in output:
		if line.find(process_name) != -1:
			return true
	return false
