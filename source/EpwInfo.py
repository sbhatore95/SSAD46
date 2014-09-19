import os


def write():
        try:
                out_file = open("location.txt","a")
        except:
                print "Error creating file.. check if epw files in current folder !"
        for i in os.listdir("."):
                if i.endswith(".epw"):
                        print "opening: file" + i , 
                        f = open(i,"r")
                        Lines = f.readlines()
                        i = 0
                        while i == 0 :
                                out_file.write(Lines[i])
                                f.close()
                                i+=1
        out_file.close()

write()
        
