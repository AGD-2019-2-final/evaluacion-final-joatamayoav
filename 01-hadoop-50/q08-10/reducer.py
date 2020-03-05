import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    total = 0
    cantidad = 1
    promedio = 0


    for line in sys.stdin:

        key, val = line.split("\t")
        val = float(val)

        if key == curkey:

            total += val
            cantidad += 1
            promedio = total/cantidad
            
        else:

            if curkey is not None:

                sys.stdout.write("{}\t{}\t{}\n".format(curkey, total, promedio))

            curkey = key
            total = val
            cantidad = 1
            promedio = total/cantidad

    sys.stdout.write("{}\t{}\t{}\n".format(curkey, total, promedio))