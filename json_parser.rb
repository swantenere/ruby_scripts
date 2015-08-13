require 'open-uri'
require 'json'


page=1
result=nil
per_page=10
hd_true=0
hd_false=0
p "please wait till we calculate the results"

while page==1||result["more"] do
  request_uri="http://api.viki.io/v4/videos.json?app=100250a&per_page=#{per_page}&page=#{page}"
  buffer=open(request_uri).read
  result=JSON.parse(buffer)
  i=0
  while(i<per_page) do
    if result["response"][i]["flags"]["hd"]
      hd_true+=1
    else
      hd_false+=1
    end
    i+=1
  end
  page+=1
end

p "The number of response objects with hd set to true is #{hd_true}"
p "The number of response objects with hd set to true is #{hd_false}"
