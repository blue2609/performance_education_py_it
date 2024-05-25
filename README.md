- [Overview](#overview)
- [Automation/Tools](#automationtools)
	- [Monitor Clipboard](#monitor-clipboard)
		- [Requirements](#requirements)
			- [Python](#python)
			- [Automator](#automator)
			- [Environment Variables Setup](#environment-variables-setup)
				- [`.zshrc` Variables Setup](#zshrc-variables-setup)
				- [`.env` Variables Setup](#env-variables-setup)

# Overview

This is a repository which contains multiple tools to help students in Performance Education PY (Professional Year) Program. The next section outlines the list of tools/automations included in this repository

# Automation/Tools

## Monitor Clipboard
Currently on works on macOS; this tool aims to monitor our clipboard, replacing any string in our clipboard that matches this pattern:

```shell
{number}_{student_no}{last_name}{first_name}{subject_code}
```

and below are a few examples of a string which matches this criteria:
- `2_23456BloggsJoeABCSAEval`
- `1_123456RandomPersonABCSomething`
- `3_123456RandomPersonLMOPF`

### Requirements

#### Python

You need to have Python installed to have this working. There are no third party Python modules/packages that need to be installed to get this tool working hence why there are no `requirements.txt` or any package dependency files included with the project **(this might change in the future)**

#### Automator

Second, you need to copy/paste this code below and create a new Automator **Run Shell Script** action and please copy & paste the command below:

```shell
#!/bin/zsh
source ~/.zshrc
cd {project_directory_on_local_machine}
osascript replace_clipboard.applescript
```

Where the `{project_directory_on_local_machine}` is the absolute path to the cloned repository directory on your local machine

Please remember the path to created Automator workflow `.workflow` file

#### Environment Variables Setup

##### `.zshrc` Variables Setup

First, you need to add these lines of code to your `~/.zshrc` file

```shell
# Define extra environment variables for PE_PY_IT
export PE_PY_IT_STUDENT_NO={student_no}			# 123456
export PE_PY_IT_STUDENT_LAST_NAME={first_name}	# Bloggs
export PE_PY_IT_STUDENT_FIRST_NAME={last_name}	# Joe
```

These are the value that will used to replace the original string `student_no`, `last_name` and `first_name`

##### `.env` Variables Setup

Please copy the content of `.env.example` file, rename it to `.env` and replace the values set for each variable to the right one based on your project setting on your local machine





