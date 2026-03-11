import os

BASE_DIR = os.path.abspath(os.path.dirname(__file__))

class Config:
    # Use Postgres if the URL is provided, otherwise fallback to SQLite
    SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL') or \
        'sqlite:///' + os.path.join(BASE_DIR, 'database.db')
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'dev-key-123'
    UPLOAD_FOLDER = os.path.join(BASE_DIR, 'static', 'uploads')