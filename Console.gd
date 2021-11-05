extends Control

onready var window:=$Window;
onready var output:=$Window/VBox/Output;
onready var input:=$Window/VBox/Input;
var is_open:=false;

#Commands
#func cmd_command(arg0,arg1=""):
func cmd_help(arg0="") -> void:
	if arg0.empty():
		for cmd in CmdInfo.CMDS:
			console_output("* "+cmd);
			console_output("* Description: [color="+CmdInfo.COLORS.VAL+"]"+CmdInfo.CMDS[cmd]["desc"]+"[/color]",CmdInfo.COLORS.CMD);
			console_output("* Syntax: [color="+CmdInfo.COLORS.VAL+"]"+CmdInfo.CMDS[cmd]["syntax"]+"[/color]",CmdInfo.COLORS.CMD);
	elif arg0 in CmdInfo.CMDS:
		console_output("* "+arg0);
		console_output("* Description: [color="+CmdInfo.COLORS.VAL+"]"+CmdInfo.CMDS[arg0]["desc"]+"[/color]",CmdInfo.COLORS.CMD);
		console_output("* Syntax: [color="+CmdInfo.COLORS.VAL+"]"+CmdInfo.CMDS[arg0]["syntax"]+"[/color]",CmdInfo.COLORS.CMD);
	else:
		console_output("This is not a valid command.",CmdInfo.COLORS.ERR);
		
	return;
func cmd_clear() -> void:
	output.bbcode_text="";
	return;
func cmd_about() -> void:
	console_output("ConsoleIO - The simple debugger");
	console_output("* Author: [color="+CmdInfo.COLORS.VAL+"]codeburr[/color]",CmdInfo.COLORS.CMD);
	console_output("* Version: [color="+CmdInfo.COLORS.VAL+"]0.1.0[/color]",CmdInfo.COLORS.CMD);
	return;

#Console
func _ready():
	console_output("Type 'help' for help.",CmdInfo.COLORS.CMD);
	pass;
func _input(event):
	if event.is_action_pressed("ui_home"):
		if !is_open: console_show();
		else: console_hide();
	pass;
func console_show() -> void:
	is_open=true;
	window.set_process(true);
	window.set_process_input(true);
	window.show();
	input.clear();
	return;
func console_hide() -> void:
	is_open=false;
	window.hide();
	window.set_process(false);
	window.set_process_input(false);
	window.set_position(get_viewport().size/2-window.rect_size/2);
	return;
func console_input(txt:String) -> void:
	input.clear();
	if txt.strip_edges().empty(): return;
	console_output("> "+txt,CmdInfo.COLORS.CMD);
	console_check(txt);
	return;
func console_check(txt:String) -> void:
	var all:Array=txt.to_lower().split(" ",false);
	var cmd:String=all[0];
	var cmd_args:Array=[];
	var args:Array=[];
	var opt:int=0;
	
	if len(all)>1:
		cmd=all.pop_front();
		args=all;
	
	if cmd in CmdInfo.CMDS:
		cmd_args=CmdInfo.CMDS[cmd]["args"];
		opt=cmd_args.count([]);
		
		if len(args)<(len(cmd_args)-opt):
			console_output(CmdInfo.MSGS.notEnoughArg,CmdInfo.COLORS.ERR); return;
		elif len(args)>len(cmd_args):
			for i in range(0,len(args)-len(cmd_args)): 
				args.pop_back();
		elif len(args)>=(len(cmd_args)-opt) and len(args)<=len(cmd_args):
			if has_method("cmd_"+cmd):
				if len(args)>0: callv("cmd_"+cmd,args); else: call("cmd_"+cmd);
	else:
		console_output(CmdInfo.MSGS.notValidCmd,CmdInfo.COLORS.ERR);
		
	return;
func console_output(msg="",color:String=CmdInfo.COLORS.MSG) -> void:
	var all:String=output.bbcode_text;
	var val:String="[color="+color+"]"+str(msg)+"[/color]";
	output.bbcode_text=val if all.empty() else all+"\n"+val;
	return;
