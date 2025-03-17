# AI Tutor

AI Tutor is a Rails-based AI-integrated learning platform designed to personalize education. Users take a **learning test**, which is analyzed to determine their preferred learning style. Based on the results, AI Tutor leverages **ChatGPT** to present information in a way that best suits each individual.

## Features

- **Personalized Learning Experience**: Users receive educational content tailored to their learning style.
- **AI-Powered Adaptation**: ChatGPT adapts responses based on test analysis.
- **Interactive Learning Test**: Determines how users learn best through tasks and demonstrations.
- **Seamless AI Integration**: Uses OpenAI's API for intelligent responses.
- **Fully Containerized**: Runs in **Docker** for easy deployment.
- **Foreman for Process Management**: Simplifies running services in development.

## Getting Started

### Clone the Repository
```sh
git clone https://github.com/your-username/ai_tutor.git
cd ai_tutor
```

### Set Up Environment Variables
Create a `.env` file and configure it with your OpenAI API key and other environment-specific settings.

### Running with Docker
Ensure you have Docker and Docker Compose installed.

#### Start the Application
```sh
docker-compose up
```
This will start the app along with any dependencies defined in the `docker-compose.yml` file.

### Running in Development with Foreman
We use Foreman to manage multiple processes during development.

#### Start the Application with Foreman
```sh
foreman start -f Procfile.dev
```
This runs all services defined in `Procfile.dev`, such as the Rails server, workers, and any other background tasks.

## Technologies Used
- Ruby on Rails – Web framework
- ChatGPT (OpenAI API) – AI-powered responses
- Docker – Containerized environment
- Foreman – Process management
- PostgreSQL – Database


