@echo off
echo "IP DB :"
docker exec docker_db_1 bash -c "hostname -i"
exit