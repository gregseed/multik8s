  
# Build all our images, # tag each one

docker build -t gregseed/multi-client:latest -t gregseed/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t gregseed/multi-server:latest -t gregseed/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t gregseed/multi-worker:latest -t gregseed/multi-worker:$SHA -f ./worker/Dockerfile ./worker

# push each to docker hub

docker push gregseed/multi-client:latest
docker push gregseed/multi-server:latest
docker push gregseed/multi-worker:latest

docker push gregseed/multi-client:$SHA
docker push gregseed/multi-server:$SHA
docker push gregseed/multi-worker:$SHA


# Apply all configs in the 'k8s' folder

kubectl apply -f k8s

# Imperatively set latest images on each deployment

kubectl set image deployments/client-deployment client=gregseed/multi-client:$SHA
kubectl set image deployments/server-deployment server=gregseed/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=gregseed/worker-worker:$SHA