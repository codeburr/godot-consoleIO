# godot-consoleIO
A simple debug console for Godot Engine.
#
To create new commands:

1- Go to CmdInfo.gd and add a new one in the CMDS dictionary following this syntax:

```
  "command":
      "desc": "description",
      "syntax": "command <required> [optional]",
      "args": [0,[0]]
```

2- Create a function in the Console.gd file following this syntax:
```
  func cmd_command():
  # The command must remain the same used to create, with the prefix "cmd_".
```

Some customizations are available in the CmdInfo.gd file.
