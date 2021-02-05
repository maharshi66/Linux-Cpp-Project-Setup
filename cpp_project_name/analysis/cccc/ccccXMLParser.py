import sys, os
import xml.dom.minidom

def main():
    # use the parse() function to load and parse an XML file
    doc = xml.dom.minidom.parse( sys.argv[1] )
    
    expertise = doc.getElementsByTagName("member_function")

    showWarning = False
    showError = False

    dataList = {}

    for skill in expertise:
        nameNode = skill.getElementsByTagName("name")[0]
        funcName = nameNode.childNodes[0].data
        
        valueMcCabesCyclomaticComplexityStr = skill.getElementsByTagName("McCabes_cyclomatic_complexity")[0].getAttribute("value")
        valueMcCabesCyclomaticComplexity = int(valueMcCabesCyclomaticComplexityStr)
        
        extentNode = skill.getElementsByTagName("extent")[0]
        sourceReferenceNode = extentNode.getElementsByTagName("source_reference")[0]
        filePath = sourceReferenceNode.getAttribute("file")

        dataListKey = "'%s' in file [%s]"%( funcName, filePath )
        
        if( valueMcCabesCyclomaticComplexity > 20 ):
            showError = True
            dataListKey = "ERROR: " + dataListKey
            dataList[ dataListKey ] = valueMcCabesCyclomaticComplexity
        elif( valueMcCabesCyclomaticComplexity > 10 ):
            showWarning = True
            dataListKey = "WARNING: " + dataListKey
            dataList[ dataListKey ] = valueMcCabesCyclomaticComplexity
    
    exitVal = 0

    def printDetails():
        for i, k in enumerate(dataList):
            print("%04d: %s has \n\t McCabesCyclomaticComplexity of %d"%( i, k, dataList[k] ))
        return

    if( showError ):
        exitVal = -2
        printDetails()

    elif( showWarning ):
        exitVal = -1
        printDetails()

    else:
        print("INFO: McCabesCyclomaticComplexity for all functions/Methods is within acceptable range.")

    exit( exitVal )

if __name__ == "__main__":
    main()