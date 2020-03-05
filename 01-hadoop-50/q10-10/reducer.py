import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':
    clave_act= None
    lista=[]
    for line in sys.stdin:
        clave, valor=line.split("\t")
        valor=int(valor.replace("\n",""))
        if clave==clave_act:
            lista.append(valor)
        else:
            if clave_act is not None:
                lista.sort()
                sys.stdout.write(clave_act+"\t")
                for i in range(len(lista)):
                    if i<len(lista)-1:
                        sys.stdout.write(str(lista[i])+",")
                    else:
                        sys.stdout.write(str(lista[i])+"\n")
                lista=[]
            clave_act=clave
            lista.append(valor)
    
    lista.sort()
    sys.stdout.write(clave_act+"\t")
    for i in range(len(lista)):
        if i<len(lista)-1:
            sys.stdout.write(str(lista[i])+",")
        else:
            sys.stdout.write(str(lista[i])+"\n")