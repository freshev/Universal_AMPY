# Tools For RT-Thread MicroPython

This warehouse is the `RT-Thread MicroPython IDE` serial port command line tool back-end source code. Welcome to use [RT-Thread MicroPython](https://marketplace.visualstudio.com/items?itemName=RT-Thread.rt-thread- micropython) for MicroPython project development. Its function is to connect to a MicroPython device and perform various operations in the MicroPython development process based on the device.

## 1. Installation method

Enter the following command on the command line to install the software packages that the tool depends on:

```python
make.bat
```

## 2. How to use commands

- Run function script

After installation, you can run the cli.py script directly to operate MicroPython devices.

For example, `python cli.py -p COM18 repl` means to connect to the COM18 serial port and enter repl mode.

- Run executable file

The executable files are stored in the dist folder, which contains executable files under different operating systems:

For example, `./cli.exe -p COM18 repl` means to connect to the COM18 serial port and enter repl mode.

### 2.1 Connect to the serial port

When using any command, you need to specify the serial port for this operation. For example, `python cli.py -p COM18` means to operate the device of the COM18 serial port. This format also needs to be added before all subsequent commands.

### 2.2 Query the available serial ports in the system

- python cli.py -p query portscan

### 2.3 Enter repl mode

The command to connect the serial port and turn on repl mode is as follows:

- python cli.py -p COM18 repl

Access MicroPython's repl in the current terminal, and use `ctrl +x` in the terminal to exit repl mode.

### 2.4 Query the file system list

| Command | Function |
| ----------- | ------------------------------------------ |
| ls | Print out the file list in the / directory on the development board |
| ls -r | Recursively print out the list of files in the / directory |
| ls -r -l | Recursively print out the file list and crc check value in the / directory |
| ls /scripts | Print out the file list in the /scripts folder on the development board |

For example:

- python cli.py -p COM18 ls

### 2.5 Create and delete folders/files

| Command | Function |
| -------------- | ------------------------------------------------------ |
| mkdir dir_name | Create a folder named dir_name |
| rmdir dir_name | Recursively delete all files in the dir_name folder, eventually deleting the folder |
| rm filename | can be used to delete a specific file |

For example:

- python cli.py -p COM18 mkdir dir_test_name

### 2.6 File transfer operation

| Command | Function |
| ------------------- | ---------------------------------------------------------- |
| get xx.py xx.py | Get xx.py from the development board to the local computer and name the file xx.py |
| put xx.py xx.py | Transfer local files to the development board (note that the written files must be in unix format) |
| put dir_name remote | Push the local dir_name folder to the development board and rename it to remote |

For example:

- python cli.py -p COM18 get board.py local.py

### 2.7 Code file execution

| Command | Function |
| -------------------- | ------------------------------------------------------------ |
| run xx.py | Execute the xx.py file in the local directory on the development board |
| run none -d hello.py | Execute the `hello.py` file on the device. Note that if the program does not return, the program cannot return from the terminal |

### 2.8 Folder synchronization

```python
python cli.py -p com18 sync -l "G:\sync_dir" -i "G:\file_list_cache"
```

- The `-l` parameter is followed by the address of the local folder that you want to synchronize to the remote root directory.

- After the `-i` parameter** list of files in the device file system, cached local storage files**

A new file needs to be specified for each development board, otherwise the files will not be synchronized correctly. If you are not sure whether the specified cache file is correct, you can delete the local cache file and re-specify a new file address. The synchronization code will Re-read the shutdown information from the device file system and write it to this file.

### 2.9 Method to turn off repl command line echo

Sending b'\xe8' characters to the serial port will turn off the echo function, and sending b'\xe9' to the serial port will turn the echo function back on. This function can be used to turn off echo before pressing `CTRL + E` to enter paste mode, so that the input content is not displayed on the terminal.

## 3. Contribution 
Adopt AMPY cli.exe to use with A9/A9G Ai-thinker module.

## 4. Use with VS Code
* install VS Code
* install rt-thread-micropython plugin
* run `make.bat`

