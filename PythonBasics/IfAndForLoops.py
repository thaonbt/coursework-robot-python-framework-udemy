
# IF
greeting = "Good morning"
a = 4

# if greeting == "Good morning":
if a > 2:
    print("Condition matches")
else:
    print("Condition does not match")

print("if ese condition code is completed")

# FOR LOOP
print("************************************************")
obj = [2, 3, 5, 7, 9]
for i in obj:
    print(i)
    print(i*2)

# SUM of First Natural numbers 1+2+3+4+5 = 15
print("************************************************")
summation = 0
for j in range(1, 6):    # range(i, j) -> i to j-1
    print(j)
    summation = summation + j
print("Summation is " + str(summation))

print("************************************************")
for k in range(1, 10, 2):
    print(k)
print("**********SKIPPING FIRST INDEX*****************")
for k in range(10):
    print(k)
print("************************************************")
for k in range(1, 10, 5):
    print(k)