class_name CmdInfo

const COLORS:={
	"MSG": "#cccccc", 	#Default
	"VAL": "#cccccc",	#Values
	"ERR": "#9e2f2f", 	#Error
	"CMD": "#707070" 	#Input
};
const MSGS:={
	"notValidCmd": "This command is either invalid or inexistent.",
	"notEnoughArg": "Insufficient arguments."
};
const CMDS:={
#	"command": {
#		"desc": "description",
#		"syntax": "command <required> [optional]",
#		"args": [0,[0]]
#	},
	"help": {
		"desc": "Shows help for all commands or a specific one.",
		"syntax": "help [command]",
		"args": [[]]},
	"clear": {
		"desc": "Clears console log.",
		"syntax": "clear",
		"args": []},
	"about": {
		"desc": "Tells about the console.",
		"syntax": "about",
		"args": []}
};
