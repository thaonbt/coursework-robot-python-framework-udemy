
# LIST is data type that allows multiple values and can be different data types
values = [1, 2, "rahul", 4, 5]

print(values[0])     # 1
print(values[3])     # 4

print(values[-1])    # 5

print(values[1:4])   # 2 rahul 4

values.insert(3, "shetty")       # [1, 2, 'rahul', 'shetty', 4, 5]
print(values)

values.append("End")            # [1, 2, 'rahul', 'shetty', 4, 5, 'End']
print(values)

values[2] = "RAHUL"             # [1, 2, 'RAHUL', 'shetty', 4, 5, 'End']
print(values)

del values[0]
print(values)                  # [2, 'RAHUL', 'shetty', 4, 5, 'End']


# TUPLE -Same as LIST Data type but immutable
val = (1, 2, "rahul", 4.5)

print(val[1])

# val[2] = "RAHUL"    # will got error when running this

# DICTIONARY
dic = {"a": 2, 4: "bcd", "c": "Hello word"}
print(dic[4])
print(dic["c"])

#
dict={}
print(dict)
dict["firstname"] = "rahul"
dict["lastname"] = "shetty"
dict["gender"] = "male"
print(dict)
print(dict["lastname"])