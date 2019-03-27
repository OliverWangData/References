import requests
import bs4

url = "https://en.wikipedia.org/wiki/Apex_Legends"
req_html = requests.get(url).text

if req_html is not None:
    soup = bs4.BeautifulSoup(req_html,"html.parser")
    soup = soup.find("div",{"class":"mw-parser-output"})
    
    for p in soup.find_all("p"):
        current_text = p.text.strip()
        print(current_text)
        