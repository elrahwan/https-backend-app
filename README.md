# https-backend-app
the use of it
# in the same directory do
docker compose up 
# then after that when finished with it
docker compose down -v 
# if any problem occurred after the first time do:
docker compose up --build
# Note: put the name of example.com in the hosts file in your machine in the IP of your machine 
# Now your application is ready to go to test it do:
curl -k https://example.com:8443
