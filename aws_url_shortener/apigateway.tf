resource "aws_api_gateway_rest_api" "url_shortener_api" {
  body = jsonencode({
    "openapi" : "3.0.3",
    "info" : {
      "title" : "URL Shortener",
      "description" : "A very simple URL shortener API",
      "version" : "1.0.0"
    },
    "servers" : [
      {
        "url" : "https://petstore3.swagger.io/api/v3"
      }
    ],
    "tags" : [
      {
        "name" : "shortener",
        "description" : "A simple URL shortener API"
      },
      {
        "name" : "pet",
        "description" : "Everything about your Pets",
        "externalDocs" : {
          "description" : "Find out more",
          "url" : "http://swagger.io"
        }
      },
      {
        "name" : "store",
        "description" : "Access to Petstore orders",
        "externalDocs" : {
          "description" : "Find out more about our store",
          "url" : "http://swagger.io"
        }
      },
      {
        "name" : "user",
        "description" : "Operations about user"
      }
    ],
    "paths" : {
      (var.shorten_path) : {
        "post" : {
          "tags" : [
            "shortener"
          ],
          "summary" : "Shortens a URL",
          "description" : "Shortens a URL",
          "requestBody" : {
            "description" : "Shorten a URL",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/URL"
                }
              },
              "application/x-www-form-urlencoded" : {
                "schema" : {
                  "$ref" : "#/components/schemas/URL"
                }
              }
            }
          },
          "responses" : {
            "200" : {
              "description" : "Success",
              "content" : {
                "application/json" : {
                  "schema" : {
                    "$ref" : "#/components/schemas/URL"
                  }
                }
              }
            },
            "400" : {
              "description" : "Bad request"
            }
          }
        }
      },
      (var.hydrate_path) : {
        "get" : {
          "tags" : [
            "shortener"
          ],
          "summary" : "Redirects to a URL based on the shortcode",
          "description" : "Redirects to a URL based on the shortcode",
          "operationId" : "redirectToURL",
          "parameters" : [
            {
              "name" : "shortCode",
              "in" : "path",
              "description" : "The URL short code",
              "required" : true,
              "schema" : {
                "type" : "string"
              }
            }
          ],
          "responses" : {
            "302" : {
              "description" : "A temporary redirect to a URL"
            },
            "404" : {
              "description" : "The URL short code provided was not found"
            }
          }
        }
      }
    },
    "components" : {
      "schemas" : {
        "URL" : {
          "type" : "object",
          "properties" : {
            "url" : {
              "type" : "string",
              "format" : "url",
              "example" : "http://example.com"
            }
          }
        }
      }
    }
  })

  name = var.rest_api_name

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}
