ap = 15
rp = 7
with open('sannico.in') as data:
    roll = []
    acum = []
    prev = None
    for line in data:
        f = line.split()
        change = 'NA'
        if f[1] != 'NA':
            value = int(f[1])
            change = value - prev if prev is not None else 'NA'
            at = sum([a if a != 'NA' else 0 for a in acum]) if len(acum) == ap else 'NA'
            ra = (sum([r if r != 'NA' else 0 for r in roll]) / (rp - roll.count('NA'))) if len(roll) == rp else 'NA'
            print(f[0], value, change, at, ra)
            prev = value        
        else:
            print(f[0], 'NA NA NA NA')
        roll.append(change)
        acum.append(change)
        if len(roll) > rp:
            roll.pop(0)
        if len(acum) > ap:
            acum.pop(0)
            
