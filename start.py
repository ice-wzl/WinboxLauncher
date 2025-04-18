#!/usr/bin/python3
import sys
import os
import subprocess 

# user input
def GetVersion():
    print("[*] Example: 6.43")
    router_version = input("Enter RouterOS version: ")
    return router_version


def ValidateVersion(version: str):
    split_version = version.split(".")
    if (int(split_version[0]) == 7):
        return 4
    elif (int(split_version[0]) == 6 and int(split_version[-1]) >= 43):
        return 4
    elif (int(split_version[0]) == 6 and int(split_version[-1]) <= 43):
        return 3
    elif (int(split_version[0]) >= 8):
        return -1
    else:
        return -1

def Driver():
    tgt_version = GetVersion()
    while ("." not in tgt_version):
        tgt_version = GetVersion()
    
    winbox_version = ValidateVersion(tgt_version)
    if (winbox_version == -1):
        print("[*] No compatable WinBox version, sorry")
        sys.exit(255)
    elif (winbox_version == 3) and os.path.exists("winbox/winbox3.29.exe"):
        print(f"Launching winbox3.29...")
        subprocess.run(["wine", "winbox/winbox3.29.exe"])
    elif (winbox_version == 4) and os.path.exists("winbox/winbox4.0"):
        print("Launching winbox4.0...")
        subprocess.run(["winbox/winbox4.0"])


# v6.x	Winbox 3.x	Full support; stable
# v7.x	Winbox 3.36+ or Winbox 4	Winbox 4 requires RouterOS ≥ 6.43



if __name__ == '__main__':
    Driver()





