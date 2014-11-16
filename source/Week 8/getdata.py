"""
To make Getdata.txt to populate Weatherdata model :) 
"""




import os
import glob
import re
import csv
from random import randint
k=glob.glob('*.epw') 


#Check for Solar Radiation 
num=0
n = open("Getdata.txt","w")
for i in k:
    num=num+1
    with open(i) as f:    
        a=[]
        maxyear=[]          #Id = Month-1
        minyear=[]
        

        print i    
        reader = csv.reader(f)
        headerline1 = reader.next()
        headerline2 = reader.next()
        headerline3 = reader.next()
        headerline4 = reader.next()
        headerline5 = reader.next()
        headerline6 = reader.next()
        headerline7 = reader.next()
        headerline8 = reader.next()

        monthdata=[]
        for i in range(0,32):
            monthdata=monthdata + [[0,1000,0,0]]

        #print monthdata

        monthinpro=1                            #Id= Date -1,(MinTime,MinTemp,MaxTime,Maxtemp) 
        for row in reader:

            

            try:
                
                time = int(row[3])
                month = int(row[1])
                day = int(row[2])
                yr = int(row[0])
                #DNR = int(row[14])
                #DHR = int(row[15])
                temp= float(row[6])
                rhum= float(row[8])
                if (month>monthinpro) :
                    numday=0
                   # smintime=0
                    smintemp=0
                    smaxtemp=0
                    #smaxtime=0
                    for i in range(0,32):
                        if(monthdata[i]!=[0,1000,0,0]):
                            numday=numday+1
                     #       smintime=smintime+ monthdata[i][0]
                            smintemp=smintemp+ monthdata[i][1]
                            smaxtemp=smaxtemp+ monthdata[i][3]
                      #      smaxtime=smaxtime+ monthdata[i][2]

                    data = (smintemp/numday)
                    data2 =(smaxtemp/numday)

                    maxyear.append(data2)
                    minyear.append(data)
                    monthinpro = month
                    monthdata=[]
                    for i in range(0,32):
                        monthdata=monthdata+ [[0,1000,0,0]]



                #print monthdata,monthinpro,day 
                
                if(monthdata[day-1]==[0,100,0,0] or monthdata[day-1][1]>temp):
                    monthdata[day-1][1]=temp
                    monthdata[day-1][0]=time
                    

                if((monthdata[day-1][2]==0 and monthdata[day-1][3]==0) or monthdata[day-1][3]<temp):
                    monthdata[day-1][3]=temp
                    monthdata[day-1][2]=time



            except:
                numday=0
                #smintime=0
                smintemp=0
                smaxtemp=0
                #smaxtime=0
                for i in range(0,32):
                    if(monthdata[i]!=[0,1000,0,0]):
                        numday=numday+1
                 #       smintime=smintime+ monthdata[i][0]
                        smintemp=smintemp+ monthdata[i][1]
                        smaxtemp=smaxtemp+ monthdata[i][3]
                  #      smaxtime=smaxtime+ monthdata[i][2]

                data =(smintemp/numday)
                data2 =(smaxtemp/numday)

                maxyear.append(data2)
                minyear.append(data)


        f.close()
        n.write(headerline1[1])
        n.write(",")        
        fname= headerline1[1].strip()
        fname = fname.replace("/","")
        fname =fname.replace("'","")+ ".txt"
        n.write(fname)
        n.write(",")
        for i in range(0,12):
            n.write(str(round(maxyear[i],2)))
            n.write(",")
        for i in range(0,12):
            n.write(str(round(minyear[i],2)))
            n.write(",")
            
        n.write("\n")
n.close()


