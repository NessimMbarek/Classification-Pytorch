# Use the PyTorch base image
FROM pytorch/pytorch:latest

# Set working directory inside the container
WORKDIR /cnn-project

# Copy the requirements file to the container
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project files
COPY . .

# Create necessary directories
RUN mkdir -p ./data ./plots

# Set the default command to run the application
CMD ["python3", "main.py", "--mode", "test", "--data_path", "./data/test/", "--model_path", "./models/cnn_resnet18_freeze_backbone_False.pth"]
