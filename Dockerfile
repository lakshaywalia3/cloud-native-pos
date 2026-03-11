# Use a full python image instead of 'slim' - it's bigger but has all the tools
FROM python:3.10

# Set working directory
WORKDIR /app

# Copy requirements and install
COPY requirements.txt .

# We add --upgrade pip just to be safe
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . .

# Run the app
CMD ["python", "app.py"]