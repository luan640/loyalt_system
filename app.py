import kagglehub

# Download latest version
path = kagglehub.dataset_download("teocalvo/teomewhy-loyalty-system")

print("Path to dataset files:", path)