# Jupyter-Vim

A vim plugin for developing python code without leaving the terminal.

## Installation

If you don't have a preferred installation method, I recommend
installing [pathogen.vim](https://github.com/tpope/vim-pathogen), and
then run:

```bash
    $ cd ~/.vim/bundle
    $ git clone https://github.com/broesler/jupyter-vim.git
```

Once help tags have been generated, you can view the manual with
`:help jupyter-vim`.

## Quickstart
To begin:

Need to install Jupyter on the local machine (NOT Anaconda).

`sudo apt-get install python3-pip`
`/usr/bin/pip3 install jupyter`


```bash
	$ jupyter qtconsole &  # open a jupyter console window
	$ vim <your_script>.py
```

In vim: `:JupyterConnect`

Then, use `:JupyterRunFile`, or `:[range]JupyterSendRange` to execute lines of
code!

To make QtConsole output whatever text you send it, you can set the following in your ~/.jupyter/jupyter_qtconsole_config.py:

`c.ConsoleWidget.include_other_output = True`

This instructs QtConsole to echo the communication between the IPython kernel and the Vim. This causes the commands send by Vim to the kernel and the response of the kernel to be shown in the QtConsole window.

## Usage

If everything is setup correctly, you should be able to open a QtConsole and a Vim instance running side by side. Then, in Vim, open a Python file and give the following command:

`:JupyterConnect`

Vim will attempt to connect to the IPython kernel. If this is successful you can use (among others) the following keybindings to send Python code to be executed on the kernel:
```
<localleader>R    Run the file
<localleader>I    Import the file
<localleader>d    Change the working directory of the Jupyter kernel
                  to the directory containing this file
<localleader>X    Execute this code cell (delimit with ##, #%% or # )
<localleader>E    Execute this line
<localleader>e    Use with any text-object to execute it. Or in visual 
                  mode: execute selected code
```
You will see the communication between Vim and the kernel displayed in the QtConsole, prefixed with [remote].

## Info
Once I fell in love with Vim, I couldn't bear having to jump back and forth
between the ipython/jupyter console and editor anymore. I modeled this simple
interface off of the ideas in
[vim-ipython](https://github.com/ivanov/vim-ipython), but have pared down many
of the features, like the replication of the Jupyter console in a vim buffer,
to make the plugin much more 'lightweight'.

Still a work in progress!

### CONTRIBUTING

Please feel free to contact me at [bernard.roesler@gmail.com](mailto:bernard.roesler@gmail.com), with the subject line: "[jupyter-vim]: Contributing".

### CREDITS
I owe significant thanks to the original developer of this plugin: 
[Paul Ivanov](https://github.com/ivanov), as well as 
[Marijn van Vliet](https://github.com/wmvanvliet).
It is far easier to update something that already works well than to forge
a new path from scratch.

