# Use an official Python runtime as a parent image
FROM python:3.12.0-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port your app runs on
EXPOSE 5000

# Define the command to run your app using Gunicorn
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:5000"]
