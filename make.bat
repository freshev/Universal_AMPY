python -m venv .virt
call .virt\Scripts\activate.bat
pip install pyserial click python-dotenv pyinstaller
pyinstaller.exe --hidden-import serial --hidden-import click --hidden-import python-dotenv -F .\cli.py -p ampy
copy .\dist\cli.exe C:\Users\USER\.vscode\extensions\rt-thread.rt-thread-micropython-1.0.11\ampy 
