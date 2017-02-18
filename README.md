## About
The **tdls** utility is a branch of the [sched](https://raginttiger.github.io/sched/)
utilisty, except that it creates a `.todolist` file in the current working
directory, and not the home directory (like [sched](https://raginttiger.github.io/sched/) does).

## Installation
To configure your environment to use the script follow the below steps. First
clone and cd into the **tdls** repository:

```
git clone https://github.com/RagingTiger/tdls
cd tdls/
```

Next you're going to append the shell script path to your .bashrc or .zshrc:

```
echo "# alias for tdls" >> "$HOME/.`basename $SHELL`rc"
echo "alias tdls=$PWD/tdls.sh" >> "$HOME/.`basename $SHELL`rc"
source "$HOME/.`basename $SHELL`rc"
```

To check that it worked, run the tail command:

```
tail "$HOME/.`basename $SHELL`rc"
```

You should get output like this:

```
.
.
.
# alias for tdls
alias tdls=/path/to/your/repository/tdls/tdls.sh
```

## Usage
Using the **tdls** command is the same as [sched](https://raginttiger.github.io/sched/):

```
Usage:
    tdls                 Simply prints out todolist of working directory
    tdls rm              Removes entire todolist file
    tdls ed              Opens todolist file in nano editor
    tdls add <entry>     Adds new entry to todolist
    tdls read            Allows for scrollable reading of todolist
    tdls help            Prints out this help doc          
```

 * The first case is simply typing the **tdls** command. This will just dump
the contents of your todolist file to the terminal stdout. If no file is found
you will be asked if you want to create one

* Next is the **rm** subcommand. Typing **tdls rm** will completely delete your
todolist file

* To open your schedule file simply use the **ed** subcommand. Typing
**tdls ed** will open your todolist file in **nano** for editing.

* The **add** subcommand will add the entire contents of ```<entry>``` to the
schedule file. Simply type **tdls add <entry>** and it will be appended to
the todolist.

* To read the todolist without editing and with scrolling, just use the **read**
subcommand. Typing **tdls read** will open the todolist file in an interactive
and scrollable window.

* Finally the **help** subcommand will print the usage message to stdout.
