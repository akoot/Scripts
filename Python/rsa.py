# This is a DIY script
# Bonus RSA script :)

def thing(a, b):
	for x in range(1, 5):
		y = pow(2, x)
		z = pow(a, y) % b
		print (a, "^", y, "mod", b, "=", z)

thing(14, 45)


# C = pow(M, e) % pq

pq = 55
e = 3;

message = [2, 21, 6, 6, 1, 12, 15]
for M in message:
	# print(M)
	C = pow(M, e) % pq
	print(C, end=' ')

print()
for x in [27, 1, 11, 15]:
	M = ((pow(x, 6) % 55) * (pow(x, 8) % 55) * (pow(x, 2) % 55) * (x % 55)) % 55
	print(M, M % 26)

print(pow(27, 27) % 55)
