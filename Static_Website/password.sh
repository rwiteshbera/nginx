# Create Password for Basic Auth in Nginx

# Check if the script is executed as root 
# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root."
  exit 1
fi

# Prompt for username
read -p "username: " user

# Check if username is empty
if [ -z "$user" ]; then
    echo "Username cannot be empty."
    exit 1
fi

# Prompt for password
read -s -p "password: " pass

# Check if password is empty
if [ -z "$pass" ]; then
    echo "Password cannot be empty."
    exit 1
fi


# If password already exists, delete it
if [ -f "./config/.htpasswd" ]; then
    rm ./config/.htpasswd
fi

# Create User
echo -n "$user:" >> ./config/.htpasswd
# Ask for password prompt
openssl passwd -apr1 "$pass" >> ./config/.htpasswd