# godot-consoleIO
A simple debug console for Godot Engine.
![image](https://user-images.githubusercontent.com/86753097/140538800-7dc74afd-719f-42ac-b167-47b8ffd118f5.png)
#
To create new commands:

1- Go to CmdInfo.gd and add a new one in the CMDS dictionary following this syntax:

```
  "command":
      "desc": "description",
      "syntax": "command <requiered> [optional]",
      "args": [0,[0]]
```

2- Creating a function in the Console.gd file following this syntax:
```
  func cmd_command():
  # The command must remain the same used to create.
```

Some customizations are available in the CmdInfo.gd file.
