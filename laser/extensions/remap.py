import os

def doreload(self, **words):
    print ('Reloading axis')
    os.spawnlp(os.P_NOWAIT, './extensions/reload.sh', './extensions/reload.sh')

