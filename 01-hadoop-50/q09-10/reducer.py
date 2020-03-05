import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    Clave_act = None
    letra = []

    for line in sys.stdin:
        
        Clave,fecha,valor = line.split(',')
        
        letra.append([int(valor.replace('\n','')),Clave,fecha])

    letra.sort()

    for i in range(6):
        sys.stdout.write(letra[i][1]+'   '+letra[i][2]+'   '+str(letra[i][0])+'\n')