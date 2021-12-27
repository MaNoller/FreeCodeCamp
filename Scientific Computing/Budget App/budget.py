class Category:
  def __init__(self,object):
      self.object=object
      self.ledger=[]
  def __str__(self):
    s_len = len(self.object)
    news = int((30 - s_len) / 2) * '*'
    if 2 * len(news) + s_len < 30:
        head = news + self.object + news + '*' + '\n'
    else:
        head = news + self.object + news + '\n'

    items = ''
    sum=0

    for object in self.ledger:
        items= items+ "{:<23}".format(object['description'][0:23])+ f'{object["amount"]:>7.02f}' + '\n'
        sum= sum + object['amount']

    #out= head + items+ "{:<23}".format('Total: ')+ f'{sum:>7.02f}'
    out = head + items + 'Total:'+ f'{sum:>7.02f}'
    return out
  def deposit(self,amount,description=''):
    self.ledger.append({'amount':amount, 'description': description})
  def withdraw(self,amount,description=''):
    if self.check_funds(amount) == True:
        self.ledger.append({'amount': -amount, 'description': description})
        return True
    else: return False
  def get_balance(self):
    balance=0
    for value in self.ledger:
        balance = balance + value['amount']
    return balance
  def transfer(self, amount, category):

    if self.check_funds(amount) == True:
        self.withdraw(amount, "Transfer to %s" % category.object)
        category.deposit(amount, "Transfer from %s" % self.object)
        return True
    else: return False
  def check_funds(self, amount):
    if self.get_balance() < amount:
        return False
    else: return True
  


def create_spend_chart(categories):
  spendings={}
  spend_sum=0
  for category in categories:
    SumOfWithdr=0
    element= category.ledger
    for ledge in element:
      if ledge['amount'] < 0:
        SumOfWithdr = SumOfWithdr + ledge['amount']
    spendings[SumOfWithdr] =category.object
    spend_sum=spend_sum+SumOfWithdr
  sorted={}
  for key in spendings.keys():
    sorted[(int((key / spend_sum) * 100) / 10) * 10] = spendings[key]
  i=100
  output='Percentage spent by category\n'
  while i >=0:
    output = output+f'{i:>3}'+'| '
    for key in sorted:
      if key >= i:
        output=output + 'o  '
      else: output=output + '   '
    output=output+'\n'
    i=i-10
  output=output+ '    '+10*'-'+'\n'
  for item in sorted.items():
    max= len(item[1])
  space='     '
  output=output+space
  for row in range(max):
    for item in sorted.items():
      try:
        output=output+ item[1][row]+ '  '
      except:
        output=output+ '   '
    output=output +'\n'+space
  output=output[:len(output)-6]
  return output

