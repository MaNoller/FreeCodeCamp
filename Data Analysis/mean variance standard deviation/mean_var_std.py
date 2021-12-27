import numpy as np

def calculate(list):
    list_input=np.array(list)
    if len(list) != 9:
        print('HAHA')
        raise ValueError('List must contain nine numbers.')
        #return ValueError('List must contain nine numbers.')

    list=np.reshape(list_input,(3,3))
    mean=[[np.mean(list[:,0]),np.mean(list[:,1]),np.mean(list[:,2])],[np.mean(list[0,:]),np.mean(list[1,:]),np.mean(list[2,:])],list_input.mean()]
    var=[[np.var(list[:,0]),np.var(list[:,1]),np.var(list[:,2])],[np.var(list[0,:]),np.var(list[1,:]),np.var(list[2,:])],list_input.var()]
    std= [[np.std(list[:, 0]), np.std(list[:, 1]), np.std(list[:, 2])],
                   [np.std(list[0, :]), np.std(list[1, :]), np.std(list[2, :])], list_input.std()]
    maxi=[[np.amax(list[:, 0]), np.amax(list[:, 1]), np.amax(list[:, 2])],
                   [np.amax(list[0, :]), np.amax(list[1, :]), np.amax(list[2, :])], np.amax(list)]
    mini = [[np.amin(list[:, 0]), np.amin(list[:, 1]), np.amin(list[:, 2])],
                    [np.amin(list[0, :]), np.amin(list[1, :]), np.amin(list[2, :])], np.amin(list)]
    sum = [[np.sum(list[:, 0]), np.sum(list[:, 1]), np.sum(list[:, 2])],
                [np.sum(list[0, :]), np.sum(list[1, :]), np.sum(list[2, :])], np.sum(list)]
    output= {'mean': mean,'variance':var,'standard deviation':std,'max':maxi, 'min':mini, 'sum':sum}
    #print(output)
    return output