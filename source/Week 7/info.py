import os
import re 


arr = []
try:
    out_file = open("location.txt","w")
except:
    print "Error creating file.. check if epw files in current folder !"

for i in os.listdir("."):
    if i.endswith(".epw"):
        print "opening:" + i + '\n'
        f = open(i,"r")
        Lines = f.readlines()
        i = 0
        while i == 0 :
            out_file.write(Lines[i])
            f.close()
            i+=1
out_file.close()
f = open("places.txt","w")
with open('location.txt') as openfileobject:
        for Lines in openfileobject:
            word = re.match(r"^LOCATION,([a-zA-Z0-9_']+)\s*,?\/?(\w+),?",Lines)
            L = word.group(0).split(',')
            for i in L[1:]:
                if(i!= ''):
                     a = i + " "
                     print a
                     f.write(a)
            f.write('\n')

openfileobject.close()
f.close()



