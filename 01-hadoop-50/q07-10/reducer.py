import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    clave_act = None
    letra = []

    for line in sys.stdin:
        
        clave, fecha, valor = line.split('\t')
        
        if clave == clave_act:
            letra.append([int(valor.replace('\n','')), clave, fecha])

        else:
            if clave_act is not None:
                letra.sort()
                for i in letra:
                    sys.stdout.write(i[1]+'   '+i[2]+'   '+str(i[0])+'\n')
                letra = []
            
            clave_act = clave
            letra.append([int(valor.replace('\n','')), clave, fecha])
    letra.sort()
    for i in letra:
        sys.stdout.write(i[1]+'   '+i[2]+'   '+str(i[0])+'\n')
      