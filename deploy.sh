# #!/bin/bash
# set -e

# # === Configuration ===
# PROJECT_ID="your-gcp-project-id"
# REGION="us-central1"
# SERVICE_NAME="flutter-web"
# IMAGE_URI="gcr.io/$PROJECT_ID/$SERVICE_NAME"
# DOMAIN_NAME="www.igrowwithrita.com"
# SA_KEY="./service-account-key.json"  # Place your SA key here
# TF_STATE_BUCKET="igrow-terraform-state"
# TF_STATE_PREFIX="cloudrun"

# # === Step 1: Auth ===
# echo "🔐 Activating service account..."
# gcloud auth activate-service-account --key-file="$SA_KEY"
# gcloud config set project "$PROJECT_ID"

# # === Step 2: Ensure Terraform GCS bucket ===
# if ! gsutil ls -b "gs://$TF_STATE_BUCKET" &>/dev/null; then
#   echo "🪣 Creating Terraform state bucket..."
#   gsutil mb -p "$PROJECT_ID" -l "$REGION" "gs://$TF_STATE_BUCKET"
#   gsutil versioning set on "gs://$TF_STATE_BUCKET"
# else
#   echo "✅ Terraform state bucket already exists."
# fi

# # === Step 3: Build Flutter Web ===
# echo "🛠️ Building Flutter Web..."
# flutter build web

# # === Step 4: Build & Push Docker Image ===
# echo "🐳 Building and pushing Docker image..."
# docker build -t "$IMAGE_URI" .
# gcloud auth configure-docker
# docker push "$IMAGE_URI"

# # === Step 5: Terraform Deploy ===
# echo "🚀 Running Terraform..."
# cd terraform

# # Generate backend config if not yet created
# if [ ! -f "./backend.tf" ]; then
#   cat <<EOF > backend.tf
# terraform {
#   backend "gcs" {
#     bucket = "$TF_STATE_BUCKET"
#     prefix = "$TF_STATE_PREFIX"
#   }
# }
# EOF
# fi

# terraform init
# terraform apply -auto-approve \
#   -var="project_id=$PROJECT_ID" \
#   -var="region=$REGION" \
#   -var="container_image=$IMAGE_URI" \
#   -var="domain_name=$DOMAIN_NAME"

# echo "✅ Deployment complete."
