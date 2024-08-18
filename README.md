# Offers
- Flutter Mobile App: `https://github.com/QuDaMyker/offers`
- Backedn Spring Boot: `https://github.com/QuDaMyker/offer_core`

## Overview

- Create a simple page where users can view a list of available offers.
- Each offer should display relevant details like
   * title
   * description
   * discount percentage
   * original price
   * discounted price
- Display a “Buy Now” button on each offer.
- CRUD for Offer Feature

## Prerequisites

Before you begin, ensure you have met the following requirements:
- **Flutter**: [Install Flutter](https://www.docker.com/products/docker-desktop) on your machine.
- **Docker**: [Install Docker](https://www.docker.com/products/docker-desktop) on your machine.

## Setup Instructions

### Building the Docker Image

1. **Pull Container**:
    ```bash
    docker pull quocdanhmyker/offerservices
    ```

### Running the Docker Container Locally

1. **Run the Docker Container**:
    ```bash
    docker run -d -p 9090:9090 quocdanhmyker/offerservices:latest
    ```
    - `-d`: Runs the container in detached mode.
    - `-p 9090:9090`: Maps port 8080 on your host to port 8080 in the container. Adjust as needed.

## Usage

Template API - `Because the requirement just focus on API for Offer, Api Authenticate user will be ignored`
Be

Example:
- **Get All Offers**: `GET /offer-services/offers/?limit=10&offset=1`
- **Get Offer by ID**: `GET /offer-services/offers/{offerId}`
- **Delete Offer by ID**: `DELETE /offer-services/offers/{offerId}`
- **Update Offer**: `PUT /offer-services/offers/{offerId} with BODY`
- **Create Offer**: `POST  /offer-services/offers with BODY`

```json
{
  "info": {
    "_postman_id": "0de7cd37-cf6f-4ed7-9f4a-ec8e4e500923",
    "name": "Offer Service",
    "schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json",
    "_exporter_id": "22932269"
  },
  "item": [
    {
      "name": "Delete Offer",
      "request": {
        "method": "DELETE",
        "header": [],
        "url": {
          "raw": "{{baseUrl}}/offer-services/offers/66c177b9db1e3a429ba9602a",
          "host": ["{{baseUrl}}"],
          "path": ["offer-services", "offers", "66c177b9db1e3a429ba9602a"]
        }
      },
      "response": []
    },
    {
      "name": "Get Offer By Id",
      "request": {
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{baseUrl}}/offer-services/offers/66c173cbdb1e3a429ba96012",
          "host": ["{{baseUrl}}"],
          "path": ["offer-services", "offers", "66c173cbdb1e3a429ba96012"]
        }
      },
      "response": []
    },
    {
      "name": "Update Offer",
      "request": {
        "method": "PUT",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"title\": \"Summerad Sale\",\r\n    \"description\": \"Get the best summer discounts!\",\r\n    \"discountPercentage\": 1.0,\r\n    \"originalPrice\": 1200.0,\r\n    \"discountedPrice\": 1020.0,\r\n    \"createdAt\": \"2024-08-15T10:30:00\"\r\n}\r\n",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{baseUrl}}/offer-services/offers/66c173cddb1e3a429ba96013",
          "host": ["{{baseUrl}}"],
          "path": ["offer-services", "offers", "66c173cddb1e3a429ba96013"]
        }
      },
      "response": []
    },
    {
      "name": "Get All Offer By Offer And Limit",
      "request": {
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{baseUrl}}/offer-services/offers?limit=6&offset=1",
          "host": ["{{baseUrl}}"],
          "path": ["offer-services", "offers"],
          "query": [
            {
              "key": "limit",
              "value": "6"
            },
            {
              "key": "offset",
              "value": "1"
            }
          ]
        }
      },
      "response": []
    },
    {
      "name": "Create Offer",
      "request": {
        "method": "POST",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"title\": \"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain..\",\r\n    \"description\": \"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\r\n    \"discountPercentage\": 15.0,\r\n    \"originalPrice\": 120.0,\r\n    \"createdAt\": \"2024-08-15T10:30:00\",\r\n    \"updatedAt\": null\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{baseUrl}}/offer-services/offers",
          "host": ["{{baseUrl}}"],
          "path": ["offer-services", "offers"]
        }
      },
      "response": []
    }
  ]
}


```

## Configuration
- **PORT**: Port on which the application will run (default: 9090).
- **DATABASE_URL**: URL for the database connection (Default).
- **ENV**: BASE_URL for connection API in file `.env`. Example `BASE_URL=BASE_URL=https://localhost:9090`

## Image

![Group 1](https://github.com/user-attachments/assets/8faa8ee6-5f64-4b56-9ad1-ff7a5b57f728)

## Contact

Provide contact information for people who want to reach out regarding the project.

Example:
- **Author**: Theodore Myker
- **Email**: quocdanhmyker@example.com
- **GitHub**: [My GitHub Profile](https://github.com/QuDaMyker)
