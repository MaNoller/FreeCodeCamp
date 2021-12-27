class Rectangle:
    def __init__(self,width,height):
        self.width=width
        self.height=height

    def __str__(self):
        return 'Rectangle(width='+str(self.width)+', height='+str(self.height)+')'

    def set_width(self,new_width):
        self.width=new_width

    def set_height(self,new_height):
        self.height=new_height

    def get_area(self):
        return self.width*self.height

    def get_perimeter(self):
        return 2*self.height+2*self.width

    def get_diagonal(self):
        return (self.width ** 2 + self.height ** 2) ** .5

    def get_picture(self):
        lines=self.height
        width=self.width
        if lines>50 or width>50:
            return 'Too big for picture.'
        if width ==0 or lines==0:
            return
        output=''
        for line in range(lines):
            output=output+width*'*'+'\n'
        #output=output+width*'*'
        return output

    def get_amount_inside(self,shape):
        width_factor1= int(self.width/shape.width)
        height_factor1=int(self.height/shape.height)

        if width_factor1 >=1 and height_factor1>=1:
            return width_factor1*height_factor1
        else: return 0

class Square(Rectangle):


    def __init__(self,side):
        self.side=side
        self.width=side
        self.height=side

    def __str__(self):
        return 'Square(side='+str(self.side)+')'

    def set_side(self,side):
        self.side=side
        self.width=side
        self.height=side

    def set_height(self,side):
        self.side=side
        self.width=side
        self.height=side

    def set_width(self,side):
        self.side=side
        self.width=side
        self.height=side






