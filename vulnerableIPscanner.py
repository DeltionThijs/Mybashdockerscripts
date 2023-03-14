import requests
import re
#?query=docker port:4243 is for searching docker containers on port 4243 in that url
url = "https://api.criminalip.io/v1/banner/search?query=docker port:4243&offset=0"

payload = {}
#API key to query data from criminalIP
headers = {
    "x-api-key": "LWRK89CgBen0k0BGxprqO0Nc7tHZMTamTCulT65Ep8e9req2mfAMHD3cscLe"
}
# The response from criminalIP
response = requests.request("GET", url, headers=headers, data=payload)

# Write the found IP's response to a file
with open("output.txt", "w") as f:
    f.write(response.text)
#Writing to a file named "output.txt"
print("Vulnerable IP's written to file 'output.txt'")

with open("output.txt", "r") as f:
    text = f.read()
#Filter for only getting the IP's out of the JSON data
ip_pattern = re.compile(r"\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b")
ip_addresses = re.findall(ip_pattern, text)

# Writing it again to output.txt
with open("output.txt", "w") as f:
    for ip in ip_addresses:
        text = f.write(ip + "\n")
