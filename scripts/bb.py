#!/usr/bin/env python
import pudb
from pudb import debugger
from pynvim import attach
import os

#print("\033[?1049h")

socket=os.getenv('NVIM_LISTEN_ADDRESS')
if socket is None:
    print('NVIM_LISTEN_ADDRESS not found')
else:
    nvim = attach('socket', path=socket)

class MyDebugger(debugger.Debugger):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        socket=os.getenv('NVIM_LISTEN_ADDRESS')
        nvim = attach('socket', path=socket)
        def inner(w, size, key):
            _, pos = self.ui.source.get_focus()
            name = self.ui.source_code_provider.identifier()
            pos += 1
            nvim.command(':e %s'%name)
            nvim.command(':%s'%pos)
        self.ui.top.listen("ctrl ^", inner)

pudb.CURRENT_DEBUGGER = [MyDebugger()]

def main():
    import sys
    from optparse import OptionParser
    parser = OptionParser(
            usage="usage: %prog [options] SCRIPT-TO-RUN [SCRIPT-ARGUMENTS]")

    parser.add_option("-s", "--steal-output", action="store_true"),
    parser.add_option("--pre-run", metavar="COMMAND",
            help="Run command before each program run",
            default="")
    parser.disable_interspersed_args()
    options, args = parser.parse_args()

    if len(args) < 1:
        parser.print_help()
        sys.exit(2)

    mainpyfile = args[0]

    from os.path import exists
    if not exists(mainpyfile):
        print('Error: %s does not exist' % mainpyfile)
        sys.exit(1)

    sys.argv = args

    pudb.runscript(mainpyfile,
            pre_run=options.pre_run,
            steal_output=options.steal_output)

if __name__ == '__main__':
    main()

