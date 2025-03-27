import os
from cryptography.fernet import Fernet

# This is a DIY script, edit the code accordingly!

# Encrypt a file using the fernet algorithm
# If you really want to

def encrypt_file(file_path, password):
    with open(file_path, 'rb') as file:
        original_content = file.read()

    key = Fernet.generate_key()
    cipher_suite = Fernet(key)
    encrypted_content = cipher_suite.encrypt(original_content)

    encrypted_file_path = f"{file_path}.encrypted"
    with open(encrypted_file_path, 'wb') as encrypted_file:
        encrypted_file.write(encrypted_content)

    return key

def decrypt_file(encrypted_file_path, password):
    with open(encrypted_file_path, 'rb') as encrypted_file:
        encrypted_content = encrypted_file.read()

    cipher_suite = Fernet(password)
    decrypted_content = cipher_suite.decrypt(encrypted_content)

    decrypted_file_path = encrypted_file_path[:-len(".encrypted")]
    with open(decrypted_file_path, 'wb') as decrypted_file:
        decrypted_file.write(decrypted_content)

# Replace 'file.txt' with the actual path of the file you want to encrypt.
file_path = 'file.txt'
password = b"mrkrabs"  # Password must be bytes-like object

# Encrypt the file and get the key used for encryption
encryption_key = encrypt_file(file_path, password)
print("File encrypted successfully!")

# You can use the encryption_key to decrypt the file later if needed
# decrypt_file('file.txt.encrypted', encryption_key)
