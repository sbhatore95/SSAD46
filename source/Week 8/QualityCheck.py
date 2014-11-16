"""
QUALITY CHECK AND EPW FILE ANALYSIS MODULE

Run with epw files in the folder
Creates 'cityname'.txt file with analysis
"""


import os
import glob
import re
import csv
from random import randint
k=glob.glob('*.epw') 


#Check for Solar Radiation 
num=0
for i in k:
        num=num+1
        with open(i) as f:    
		a=[]
		maxyear=[] 			#Id = Month-1
		minyear=[]
		rown=0
		roww=0
		rowdn=0
		rowdh=0
		rowgh=0
		dh,gh,dn=[],[],[]


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

		monthinpro=1							#Id= Date -1,(MinTime,MinTemp,MaxTime,Maxtemp) 
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
					smintime=0
					smintemp=0
					smaxtemp=0
					smaxtime=0
					for i in range(0,32):
						if(monthdata[i]!=[0,1000,0,0]):
							numday=numday+1
							smintime=smintime+ monthdata[i][0]
							smintemp=smintemp+ monthdata[i][1]
							smaxtemp=smaxtemp+ monthdata[i][3]
							smaxtime=smaxtime+ monthdata[i][2]

					data = [(smintime/numday),(smintemp/numday)]
					data2 =[(smaxtime/numday),(smaxtemp/numday)]

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


					GHR = int(row[13])
					DNR = int(row[14])
					DHR = int(row[15])
					rown = rown+1
					flag = 0
					if (time < 9 or time > 18):
						if DHR > 250:
							rowdh=rowdh+1	        			
							dh = dh +[(str(yr),str(month),str(day),str(time),str(DHR))]
							flag = 1

						if DNR > 550:
							rowdn=rowdn+1	        			
							dn = dn +[(str(yr),str(month),str(day),str(time),str(DNR))]
							flag = 1

						if GHR > 550:
							rowgh=rowdgh+1	        			
							gh = gh +[(str(yr),str(month),str(day),str(time),str(GHR))]
							flag = 1
						if (flag == 1):
							roww = roww+1
							a.append((yr,day,month,time,sr))


			except:
				numday=0
				smintime=0
				smintemp=0
				smaxtemp=0
				smaxtime=0
				for i in range(0,32):
					if(monthdata[i]!=[0,1000,0,0]):
						numday=numday+1
						smintime=smintime+ monthdata[i][0]
						smintemp=smintemp+ monthdata[i][1]
						smaxtemp=smaxtemp+ monthdata[i][3]
						smaxtime=smaxtime+ monthdata[i][2]

				data = [(smintime/numday),(smintemp/numday)]
				data2 =[(smaxtime/numday),(smaxtemp/numday)]

				maxyear.append(data2)
				minyear.append(data)
			
		name= headerline1[1].strip()
		name = name.replace("/","")
		name =name.replace("'","")+ ".txt"
		print name
		n = open(name,"w")

		

		n.write( "                Average Minimum and Maximum Temperatures\n")
		n.write( "                ========================================\n")
		Months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
		n.write( "\n                         Maximum Temperatures:\n") 
		n.write( "Month:\t")
		for i in range(0,12):
			n.write(Months[i])
			n.write("\t")
		n.write( "\nAvgMax:")
		for i in range(12):
			x= round(maxyear[i][1],2)
			x=str(x)
			n.write(x)
			n.write("\t")
		n.write( "\nTime:",)
		for i in range(12):
			n.write(str(maxyear[i][0]))
			n.write("\t")
		n.write( "\n\n")
		n.write( "                         Minimum Temperatures\n")
		n.write( "Month:\t",)
		for i in range(0,12):
			n.write( Months[i])
			n.write("\t")
		n.write("\nAvgMin:")
		for i in range(0,12):
			x= round(minyear[i][1],2)
			x=str(x)		
			n.write(x)
			n.write("\t")
		n.write( "\nTime: \t")
		for i in range(0,12):
			n.write(str(minyear[i][0]))
			n.write("\t")
		n.write( "\n\n=================================================================================================\n\n")

		n.write( "                           Solar Radiation Analysis\n ")
		n.write( "                           ========================\n")
		n.write( "Lines checked: ")
		n.write(str(rown))
		n.write("\n===============\nNo. of wrong lines: ")
		n.write(str(roww))
		n.write("\n==================\n")

		n.write( "Wrong Direct Normal Radiation:\n=================================\n")
		for i in range(len(dn)): 
			n.write( "Year: ")
			n.write(dn[i][0])
			n.write("  Month: ")
			n.write(dn[i][1])
			n.write("  Day: ")
			n.write(dn[i][2])
			n.write("  Time: ")
			n.write(dn[i][3])
			n.write("  Solar radiation: ")
			n.write( dn[i][4])
			n.write("\n")

		n.write( "Wrong Global Horizontal Radiation:\n==================================\n")
		for i in range(len(gh)): 
			n.write("Year: ")
			n.write(gh[i][0])
			n.write("  Month:")
			n.write(gh[i][1])
			n.write("  Day: ")
			n.write(gh[i][2])
			n.write("  Time: ")
			n.write(gh[i][3])
			n.write("  Solar radiation: ")
			n.write( gh[i][4])
			n.write("\n")

		n.write( "Wrong Diffuse Horizontal Radiation:\n====================================\n")
		for i in range(len(dh)): 
			n.write( "Year: ")
			n.write(dh[i][0])
			n.write("  Month: ")
			n.write(dh[i][1])
			n.write("  Day: ")
			n.write(dh[i][2])
			n.write("  Time: ")
			n.write(dh[i][3])
			n.write("  Solar radiation: ")
			n.write(dh[i][4])
			n.write("\n")
		n.close()
	f.close()
        print "Files: ",num
