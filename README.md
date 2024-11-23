# Localstack
1. docker-compose up
2. terraform init
3. terraform apply -auto-approve
4. ./test_infra.sh | tee localstack_debug.log
5. docker-compose logs
