docker buildx bake --metadata-file meta.json all

cd registry-push
terraform init
terraform apply
