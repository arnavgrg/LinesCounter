# LinesCounter
This bashscript counts the number of lines of code written in your 
local github repository (cloned repository) or other any other folder
with code. 

# Download Repository

After opening the bash terminal, you can use the following command
to clone this repository:

``` git clone https://github.com/arnavgrg/LinesCounter.git ```

# Provide Permissions 
After cloning this repository, run the following command to provide 
the required permissions to run the file: 

```chmod 750 projectLines.sh```

The permission '750' provides the user with rwx permissions,
the group with rx permissions, where:

- r: read
- w: write
- x: execute

# Executing the file

**General Format:** ./projectLines [path/of/directory]

If not specified, the default path is taken to be the current directory, 
that is, the directory in which the code is being executed. 

```
Option 1: ./projectLines.sh
Output: Found 2389 lines of code in the root directory .
```

```
Option 2: ./projectLines.sh sample-project
Output: Found 4345 lines of code in ./sample-project/ .
```

To see the help page:
```
Option 1: ./projectLines.sh -h
**OR**
Option 2: ./projectLines.sh -help
**OR**
Option 3: ./projectLines.sh --help
```

# Redirecting Output

If you want to save the output into a file instead of printing 
it out to the bash terminal, you can run the command like this:

```./projectLines.sh sample-project &> lines.txt```

This will redirect both stdout and stderr to the file lines.txt

# Deleting Repository

```rm -rf LinesCounter/```
