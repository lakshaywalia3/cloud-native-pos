# 1. Start with a lightweight Linux environment that has Python pre-installed
FROM python:3.10-slim

# 2. Set the working directory inside the container (like creating a main folder)
WORKDIR /app

# 3. Copy ONLY the requirements file first 
# (This is a pro-trick to make future builds super fast)
COPY requirements.txt .

# 4. Install your Python libraries inside the container
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of your app's files from Windows into the container
COPY . .

# 6. Expose port 5000 so we can access the web interface from outside
EXPOSE 5000

# 7. The command that runs when the container starts
CMD ["python", "app.py"]