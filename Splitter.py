from PyPDF2 import PdfFileReader, PdfFileWriter
import array as arr
import os
from os import path
import sys
import errno
import time # import datetime # now = datetime.date.today()
from pathlib import Path

# pdfArray = []

def createFolder(directory):
    try:
        if not os.path.exists(directory):
            os.makedirs(directory) # print(os.listdir())
    except OSError:
        print ('Error: Creating directory. ' +  directory)
def splitPDF():
	# print("\033c", end="")
	print("Welcome to the Image File Wrapper Splitter!")
	
	if len(sys.argv) > 1:
		FileNumber = sys.argv[1]
		FileNumber = FileNumber.replace('"', '')
		print("\nThis is your selected PDF: " + FileNumber)
	else:
		FileNumber = input("\nDrag your selected PDF into this window and press Enter.\n(You might need to click inside this window after dragging it in.)\n")
		FileNumber = FileNumber.replace('"', '')	

	doTheRest(FileNumber)

def doTheRest(FileNumber):
	pdf = PdfFileReader(open(FileNumber, "rb"))
	bookmarks = pdf.getOutlines()
	a = arr.array('i', [])

	if not bookmarks:
		print("\nI don't see any bookmarks in this file.\n\nTry re-downloading the PDF from PAIR.")
		time.sleep(2)
		return

	for b in bookmarks:
		a.append(pdf.getDestinationPageNumber(b) + 1) # starts at 1, not 0

	a.append(pdf.getNumPages())
	ClientCode = input("\nClient Code to Append:\n")
	p = Path(FileNumber)

	createFolder(str(p.parent) + '/' + ClientCode + '/')
	newArray = []

	y = 1
	for x in range(len(a) - 1):
		beg = a[x]
		end = a[y] - 1
		length = a[x + 1] - a[x]
		newArray.append([beg, end, length])
		y += 1    

	newArray[len(newArray) - 1][1] += 1
	newArray[len(newArray) - 1][2] += 1

	x = 0
	pageNum = 0
	dupes = 0
	for i in newArray:
		pdf_writer = PdfFileWriter()
	
		j = 0
		while j < i[2]: # i[2] is length of document 
			pdf_writer.addPage(pdf.getPage(pageNum))        
			pageNum += 1
			j += 1

		tempTemp = pdf.outlines[x].title.replace('/', '_')
		tempTemp = tempTemp.replace(':', '_')
		tempTemp = tempTemp.replace('\\', '_')
		tempTemp = tempTemp.replace('>', '_')
		tempTemp = tempTemp.replace('<', '_')
		tempTemp = tempTemp.replace('|', '_')
		tempTemp = tempTemp.replace('*', '_')
		tempTemp = tempTemp.replace('?', '_')
		tempTemp = tempTemp.replace('Non-Final Rejection', 'Office Action')
		
		outputFilename = tempTemp + " - " + ClientCode
	
		savedFile = str(p.parent) + '/' + ClientCode + '/' + outputFilename
		
		print(savedFile + '.pdf')
		
		if os.path.exists(savedFile + '.pdf'):
			print("exists | " + savedFile + '.pdf')
			dupes += 1
			q = 2
			while q < 10:
				print("is this working?: " + str(q))
				savedFile = outputFilename = tempTemp + " " + str(q) + " - " + ClientCode
				
			#	print(save
				
				if os.path.exists(savedFile + ".pdf"):
					q += 1
				else:
					outputFilename = tempTemp + ' ' + str(q) + " - " + ClientCode
					savedFile = str(p.parent) + '/' + ClientCode + '/' + outputFilename	
					break
			
			with open(savedFile + ".pdf", "xb") as out:
				pdf_writer.write(out)
				print("created ", outputFilename)	
		else:
			with open(savedFile + ".pdf", "xb") as out:
				pdf_writer.write(out)
				print("created ", outputFilename)		

		x += 1

	if dupes == 0:
		print("\nAnd we're done! You can find the split files in the same directory as your PDF.")
		print("I also renamed any Non-Final Rejections to say Office Action.")
	else:
		print("\nAnd we're done! I found and renamed " + str(dupes) + " duplicates. They will now have a number on the end.")
		print("I also renamed any Non-Final Rejections to say Office Action.")		
	time.sleep(3)
	return

splitPDF()