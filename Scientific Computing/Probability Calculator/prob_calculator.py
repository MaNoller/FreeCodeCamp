import copy
import random
# Consider using the modules imported above.

class Hat:
    def __init__(self,**kwargs):
        self.contents=[]
        #print(kwargs)
        for key, value in kwargs.items():
            for v in range(value):
                self.contents.append(key)
        self.__backup = self.contents.copy()
        #print(self.contents)

    def draw(self,number):
        drawn=[]
        print('ÖÖÖ')
        print(self.__backup)
        self.contents=self.__backup.copy()
        print('AAAA')
        print(number)
        print(self.contents)
        for each in range(number):
            if len(self.contents)>=1:
                print('BBB')
                print(self.contents)
                draw = random.sample(self.contents,1)
                drawn.append(draw[0])
                self.contents.remove(draw[0])
            else:
                self.contents=self.__backup.copy()
                draw = random.sample(self.contents,1)
                drawn.append(draw[0])
                self.contents.remove(draw[0])
        return drawn



def experiment(hat, expected_balls, num_balls_drawn, num_experiments):
    M=0
    for i in range(num_experiments):
        expected_balls_remainder=expected_balls.copy()
        print('Numballsdrawn=:'+str(num_balls_drawn))
        print(hat.contents)
        got=hat.draw(num_balls_drawn)
        for ball in got:
            if ball in expected_balls_remainder.keys():
                if expected_balls_remainder[ball]>=2:
                    expected_balls_remainder[ball]=expected_balls_remainder[ball]-1
                else:
                    expected_balls_remainder.pop(ball, None)
        if bool(expected_balls_remainder)==False:
            M=M+1


    return M/num_experiments
