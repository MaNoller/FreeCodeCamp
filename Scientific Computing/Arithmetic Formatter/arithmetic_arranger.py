def arithmetic_arranger(problems,bool=False):

  if len(problems) > 5:
    return "Error: Too many problems."
    #exit()

  RowLen=[]
  space = "    "
  FirstRow=""
  SecondRow=""
  ThirdRow=""
  OptionalRow=""
  Counter=0

  for element in problems:
    elements = element.split()
    if elements[1] not in ("+", "-"):
      return "Error: Operator must be '+' or '-'."
      #exit()
    if elements[0].isdigit() == False or elements[2].isdigit()==False:
      return "Error: Numbers must only contain digits."
      #exit()
    if len(elements[0]) > 4 or len(elements[2]) > 4:
      return "Error: Numbers cannot be more than four digits."
      #exit()
    
    if len(elements[0]) > len(elements[2]):
      RowLen.append(len(elements[0]))
    elif len(elements[0]) < len(elements[2]):
      RowLen.append(len(elements[2]))
    else: RowLen.append(len(elements[0]))

    WhiteSpace = max(len(elements[0]),len(elements[2]))

    WhiteSpaces=[0,0]
    WhiteSpaces[0]= WhiteSpace-len(elements[0])+2
    WhiteSpaces[1]= WhiteSpace-len(elements[2])+1

    if Counter < (len(problems)-1):
####
      FirstRow = FirstRow + WhiteSpaces[0]* ' ' + elements[0]+space
      SecondRow = SecondRow + elements[1] + WhiteSpaces[1]* ' ' + elements[2]+space
      ThirdRow = ThirdRow + (WhiteSpace+2)*'-' + space

      if elements[1] == '+':
        OptionalRowElement = int(elements[0]) + int(elements[2])
      else:OptionalRowElement = int(elements[0]) - int(elements[2])

      OptionalRow = OptionalRow + ((WhiteSpace+2)-len(str((OptionalRowElement))))*' ' + str(OptionalRowElement)+space
####
    else:
      FirstRow = FirstRow + WhiteSpaces[0]* ' ' + elements[0]
      SecondRow = SecondRow + elements[1] + WhiteSpaces[1]* ' ' + elements[2]
      ThirdRow = ThirdRow + (WhiteSpace+2)*'-'

      if elements[1] == '+':
        OptionalRowElement = int(elements[0]) + int(elements[2])
      else:OptionalRowElement = int(elements[0]) - int(elements[2])

      OptionalRow = OptionalRow + ((WhiteSpace+2)-len(str((OptionalRowElement))))*' ' + str(OptionalRowElement)

    Counter= Counter+1




  arranged_problems = FirstRow+ '\n'+SecondRow+'\n'+ ThirdRow
  if bool==True:
    arranged_problems = FirstRow+ '\n'+ SecondRow+ '\n'+ ThirdRow+ '\n'+OptionalRow
  return arranged_problems
 

    #return arranged_problems